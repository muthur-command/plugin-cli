# MCOS CLI 插件

由 Supervisor 管理的 **CLI** 插件容器，面向 **MCOS**（基于 **`ghcr.io/muthur-command/base`**；OCI 标签 **`io.mcio.*`**）。

镜像构建时会下载预编译的 **`mc`**。`Dockerfile` 默认从 **`muthur-command/cli`** 的 Release 拉取（与 **`CLI_VERSION`** 对应的 `mc_amd64` / `mc_aarch64` 资源名需与上游一致）。

当前 CI 在 **`builder.yml`** 里通过 **`build-args`** 暂时指向 **`home-assistant/cli`**，以便在 **`muthur-command/cli`** 尚未发布对应制品时仍能构建；待自有仓库发布完成后，删除该 **`build-args`** 覆盖即可。

## 许可证

见 **LICENSE**（Apache-2.0；按 fork 要求保留上游版权 / NOTICE）。
