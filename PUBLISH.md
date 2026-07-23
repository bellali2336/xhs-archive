# 发布到 GitHub Pages（永久固定网址）

本目录已是一个 git 仓库，并已提交当前归档（index.html / index.pdf / index.epub / images / posts.json）。
按下面三步，就能拿到一个**永远不变**的网址，以后每次更新只跑一条命令。

## 第一步：在 GitHub 建一个仓库
1. 打开 https://github.com/new
2. 仓库名随便取，例如 `xhs-archive`（建议设为 **Public**，Private 需要 GitHub Pages 付费）
3. 不要勾选 "Add a README"，直接 Create repository

## 第二步：在本目录关联并推送（只需做一次）
把下面命令里的 `<USER>` 和 `<REPO>` 换成你的，
`<TOKEN>` 换成你的 Personal Access Token（GitHub → Settings → Developer settings → PAT，勾 repo 权限）：

```
git remote add origin https://<TOKEN>@github.com/<USER>/<REPO>.git
git push -u origin main
```

> 如果你默认分支是 master，把上面的 `main` 改成 `master`。

## 第三步：开启 Pages
1. 进入仓库 Settings → Pages
2. Source 选 **Deploy from a branch**，分支选 **main**（或 master），目录选 **/ (root)**
3. Save。几分钟后网址生效：

```
https://<USER>.github.io/<REPO>/
```

## 以后怎么更新
我每次重新生成归档后，你（或我）只需在本目录跑：

```
sync_github.bat        （Windows 双击即可）
```

网址永远不变，内容自动更新。

---
备用：如果不用 GitHub，也可以把整个 `output/` 文件夹上传到任意静态托管
（Cloudflare Pages / Vercel / 腾讯云 CloudBase / 你自己的服务器），
index.html 就是入口，效果一样。
