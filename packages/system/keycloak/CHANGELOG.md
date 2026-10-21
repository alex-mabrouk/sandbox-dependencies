# Changelog

## 2.0.0 (2026-10-20)


### ⚠ BREAKING CHANGES

* the package version no longer embeds the upstream version: the tag is `2.0.0`, the upstream version is `appVersion` in the descriptor
* the parameters are a closed JSON Schema: an unknown parameter is refused
* the role `identity` is renamed `okdp.io/identity-provider`, the dependencies are `okdp.io/platform-database`, `okdp.io/ingress`, `okdp.io/certificate-manager` and `okdp.io/secrets-backend`
* `adminPassword` is replaced by `adminCredentialsSecret`, the name of a Secret holding `admin-password`
* `users[].password` is replaced by `users[].passwordSecret` and `clients[].secret` by `clients[].secretRef`, both `{name, key}` of a Secret
* `db` is a plain string naming the database-server Connection, read through an `inputs` entry
* the package provides the `groups` client scope: a `clientScopes` entry named `groups` is refused

### Features

* describe the package with contract 0.2
* the `groups` scope puts the user's group memberships, by short name, in the `groups` claim, also for dynamically registered clients

### Bug Fixes

* a client scope without `attributes`, or a mapper without `config`, no longer breaks the rendering

## [1.0.1](https://github.com/OKDP/sandbox-dependencies/compare/keycloak/v1.0.0...keycloak/v1.0.1) (2026-09-25)


### Bug Fixes

* remove extra file updateder and revert back tag existing namings ([da6d6d3](https://github.com/OKDP/sandbox-dependencies/commit/da6d6d303095f40f840778b9846b6b156e4a6282))
* replace release please annotation with custom release definition strategy ([296e0b9](https://github.com/OKDP/sandbox-dependencies/commit/296e0b92e151e3d397d6246e43234172d5e4e4e3))
