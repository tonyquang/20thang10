# Chúc mừng 20/10 — Phan Trình Uyển Nhi

Trang web tĩnh một file, không cần build, không cài gì.

**Luồng chơi:** mini game bắt 5 trái tim (~4 giây) → mở khoá hộp quà → chạm hộp quà →
ảnh trào ra thành vòng tròn 3D trôi nổi → kéo qua lại tìm ảnh, chạm vào ảnh để xem lớn → lá thư.

## Thêm ảnh

Bỏ ảnh vào folder `img/` (jpg, png, webp… tên gì cũng được) rồi chạy:

```bash
./add-photos.sh
```

Script sẽ đổi ảnh sang **.webp** cho nhẹ, thu nhỏ còn tối đa 1600px, rồi cập nhật `img/photos.json`.
Cần `cwebp` (`brew install webp`).

Không muốn chạy script cũng được: đặt tên ảnh theo số `1.webp`, `2.jpg`, `3.png`… trang tự dò ra
(đừng để trống quá 2 số liên tiếp).

Ít ảnh thì trang tự lặp lại cho vòng tròn đầy đặn; thêm ảnh thì vòng tròn tự rộng ra.

Ghi chú dưới ảnh: sửa `CAPTIONS` trong `index.html` — `{'1':'Anh', '2':'Em', '3':'Hai đứa mình'}`.

## Xem thử ở máy

```bash
python3 -m http.server 8000
```

Mở http://localhost:8000

## Đẩy lên GitHub Pages

```bash
git init
git add .
git commit -m "Happy 20/10"
git branch -M main
git remote add origin https://github.com/<tên-github>/<tên-repo>.git
git push -u origin main
```

Vào **Settings → Pages → Source: Deploy from a branch → Branch `main` / `/ (root)` → Save**.
Khoảng 1 phút sau web chạy ở `https://<tên-github>.github.io/<tên-repo>/`.

## Cấu trúc

```
index.html       toàn bộ trang (HTML + CSS + JS, không thư viện ngoài)
img/             ảnh
add-photos.sh    đổi ảnh sang webp + cập nhật img/photos.json
.nojekyll        để GitHub Pages phục vụ file y nguyên
```

Sửa lời chúc: tìm `<div class="letter">` trong `index.html`.
Đổi độ khó game: sửa `const GOAL = 5;`.
