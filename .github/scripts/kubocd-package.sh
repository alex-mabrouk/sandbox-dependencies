#!/usr/bin/env bash
#
# Copyright 2026 The OKDP Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Build and push one KuboCD package.
#
# A package that carries an OKDP descriptor (extensions.okdp.io) is checked
# by okdp-contract, which writes the artifact config; kubocd then pushes that
# config in place of its own. Any other package is pushed as before.
#
# Usage: kubocd-package.sh <manifest> <oci repo prefix>
# Needs kubocd, okdp-contract and yq on the PATH, OKDP_CAPABILITIES set to the
# capability registry file and OKDP_CONTRACT to the target contract version.
set -euo pipefail

package="$1"
prefix="$2"

media_type="application/vnd.okdp.package.config.v1+json"
args=()

if yq -e '.extensions["okdp.io"]' "${package}" >/dev/null 2>&1; then
  config=$(mktemp)
  trap 'rm -f "${config}"' EXIT
  okdp-contract package config --contract "${OKDP_CONTRACT}" --kubocd "${package}" \
    --registry "${OKDP_CAPABILITIES}" > "${config}"
  args=(--config "${config}" --configMediaType "${media_type}" --artifactType "${media_type}")
fi

echo "kubocd package ${package} --ociRepoPrefix ${prefix} ${args[*]}"
kubocd package "${package}" --ociRepoPrefix "${prefix}" "${args[@]}"
