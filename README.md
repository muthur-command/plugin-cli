# Muthur Command CLI plugin

中文文档: [`README.zh-CN.md`](./README.zh-CN.md)

Supervisor-managed **CLI** add-on for **Muthur Command OS** (interactive `mc` shell on **`ghcr.io/muthur-command/base`**; OCI labels **`io.mcio.*`**).

The `mc` binary is downloaded at image build time. The Dockerfile defaults to **`muthur-command/cli`** releases; CI may pass **`build-args`** to point at another org/repo until matching assets exist for the pinned **`CLI_VERSION`** (see **README.zh-CN.md**).

## Origin

- **Upstream:** [home-assistant/plugin-cli](https://github.com/home-assistant/plugin-cli) — Home Assistant Supervisor CLI plugin container, from which this tree was ported.
- **In this repo:** **Muthur Command** keeps this fork for **Muthur Command OS**; behavior may diverge from upstream over time.
- **License:** Code inherited from upstream remains **Apache-2.0**; see **LICENSE** (retain upstream copyright / NOTICE where required).
