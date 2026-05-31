# Muthur Command CLI 插件

英文文档: [`README.md`](./README.md)

由 Supervisor 管理的 **CLI** 插件容器，面向 **Muthur Command OS**（基于 **`ghcr.io/muthur-command/base`**；OCI 标签 **`io.mcos.*`**）。

镜像构建时会下载预编译的 **`mc`**。`Dockerfile` 默认从 **`muthur-command/cli`** 的 Release 拉取（与 **`CLI_VERSION`** 对应的 `mc_amd64` / `mc_aarch64` 资源名需与所选 Release 一致）。

当前 **`builder.yml`** 中可通过 **`build-args`** 指定 **`CLI_ORG`** / **`CLI_REPO`**，以便在自有 **`cli`** 仓库尚未发布对应制品时仍能构建；待发布稳定后，可移除或收紧该覆盖。

## 来源

- **上游：** [home-assistant/plugin-cli](https://github.com/home-assistant/plugin-cli) — Home Assistant Supervisor 的 CLI 插件容器镜像，本仓库由其移植而来。
- **本仓库：** **Muthur Command** 维护此 fork，供 **Muthur Command OS** 使用；行为可能随时间与上游产生差异。
- **许可：** 自上游继承的代码仍为 **Apache-2.0**；详见 **LICENSE**（按 fork 要求保留上游版权 / NOTICE）。
