# Changelog

## 2.0.0 (2026-10-20)


### ⚠ BREAKING CHANGES

* the package version no longer embeds the upstream version: the tag is `2.0.0`, the upstream version is `appVersion` in the descriptor
* the parameters are a closed JSON Schema: an unknown parameter is refused
* the role `ingress` is renamed `okdp.io/ingress`
* `endpoint` is required in `metallb` mode, the node ports are limited to 30000-32767

### Features

* describe the package with contract 0.2 ([4fb88a3](https://github.com/alex-mabrouk/sandbox-dependencies/commit/4fb88a3))

## [1.0.1](https://github.com/OKDP/sandbox-dependencies/compare/ingress-nginx/v1.0.0...ingress-nginx/v1.0.1) (2026-09-25)


### Bug Fixes

* remove extra file updateder and revert back tag existing namings ([da6d6d3](https://github.com/OKDP/sandbox-dependencies/commit/da6d6d303095f40f840778b9846b6b156e4a6282))
* replace release please annotation with custom release definition strategy ([296e0b9](https://github.com/OKDP/sandbox-dependencies/commit/296e0b92e151e3d397d6246e43234172d5e4e4e3))
