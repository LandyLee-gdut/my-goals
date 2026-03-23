# Goal Tracker - GitHub Pages 部署指南

## 🚀 快速部署（推荐）

### 方式1：使用自动部署脚本

```bash
# 1. 进入 goals 目录
cd ~/.openclaw/workspace/goals

# 2. 运行部署脚本（替换为你的 GitHub 用户名）
./deploy.sh LandyLee-gdut
```

### 方式2：手动部署

#### 第一步：创建 GitHub 仓库

1. 访问 https://github.com/new
2. 填写信息：
   - **Repository name**: `my-goals`
   - **Description**: 我的目标追踪仪表盘（可选）
   - **Public** ✅（必须选公开，Private 仓库 Pages 收费）
   - **Add a README file** ✅
3. 点击 **Create repository**

#### 第二步：开启 GitHub Pages

1. 进入刚创建的仓库页面
2. 点击顶部 **Settings**
3. 左侧菜单选择 **Pages**
4. 配置：
   - **Source**: Deploy from a branch
   - **Branch**: main → / (root)
5. 点击 **Save**
6. 等待几分钟，访问 `https://LandyLee-gdut.github.io/my-goals/`

#### 第三步：上传文件

```bash
# 克隆仓库
git clone https://github.com/LandyLee-gdut/my-goals.git
cd my-goals

# 删除默认文件（保留 README）
rm -f index.html

# 复制目标文件
cp ~/.openclaw/workspace/goals/*.html .
cp ~/.openclaw/workspace/goals/*.json .

# 提交并推送
git add .
git commit -m "Initial goals dashboard"
git push origin main
```

## 📱 访问你的目标地图

部署成功后，你将拥有两个地址：

| 页面 | 地址 |
|------|------|
| **总览页** | https://LandyLee-gdut.github.io/my-goals/ |
| **百大UP主目标** | https://LandyLee-gdut.github.io/my-goals/b站百大up主_-_丝滑剪辑之路.html |

## 🔄 后续更新

每次更新目标后，重新运行部署脚本：

```bash
cd ~/.openclaw/workspace/goals
./deploy.sh LandyLee-gdut
```

或直接手动推送更改。

## ❓ 常见问题

**Q: 页面显示 404？**
A: 等待 2-5 分钟，GitHub Pages 需要时间部署。

**Q: 样式没有生效？**
A: 检查浏览器控制台（F12），可能是 CDN 资源加载慢，刷新即可。

**Q: 可以绑定自定义域名吗？**
A: 可以。在仓库 Settings → Pages → Custom domain 中设置。

## 📁 文件说明

```
goals/
├── index.html          # 总览页（所有目标列表）
├── b站百大up主_*.html   # 单个目标仪表盘
├── b站百大up主_*.json   # 目标数据（可选，用于调试）
└── deploy.sh           # 自动部署脚本
```
