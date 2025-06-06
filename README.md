# Book Search Frontend

## 專案簡介
本專案為書籍搜尋前端介面，提供使用者查詢書籍資料、瀏覽結果等功能。  
與後端 API（Book Search API）串接，並已部署至 GitHub Pages。

---

## 主要技術
- JavaScript (ES6+)
- Vue 3
- Vite
- Axios（API 請求）
- HTML / CSS
---

## 環境設定
建議使用 Node.js 16 以上版本。

1. 安裝依賴
```bash
npm install
```
2. 設定 API 端點（例如在 .env 或 vite.config.js 裡）

```env
VITE_API_BASE_URL=https://你的後端 API 網址
```

## 本地開發
啟動開發伺服器：

```bash
npm run dev
```
打開瀏覽器並造訪 http://localhost:5173（預設端口）

## 編譯與部署
編譯成靜態檔案：
```bash
npm run build
```
編譯後的檔案會放在 `dist/` 資料夾，將此資料夾內容部署到 GitHub Pages 或其他靜態網站服務。

## 部署到 GitHub Pages
1. 確認 `package.json` 有以下設定（視框架及部署方式而定）

```json
"homepage": "https://你的 GitHub 用戶名.github.io/你的 repo 名稱"
```
2. 部署指令
```bash
npm run deploy
```
（或使用 GitHub Actions 自動部署）

## 參考資源
- [Vite](https://vite.dev/)
- [Vue.js](https://vuejs.org/)
- [GitHub Pages](https://docs.github.com/en/pages) 








