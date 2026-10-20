#!/bin/sh
# Bỏ ảnh (jpg/png/heic/...) vào img/ rồi chạy ./add-photos.sh
# Script sẽ: đổi sang .webp cho nhẹ, thu nhỏ còn tối đa 1600px, rồi cập nhật img/photos.json
cd "$(dirname "$0")/img" || exit 1

command -v cwebp >/dev/null || { echo "Thiếu cwebp. Cài bằng: brew install webp"; exit 1; }

for f in *.jpg *.JPG *.jpeg *.JPEG *.png *.PNG; do
  [ -e "$f" ] || continue
  out="${f%.*}.webp"
  if cwebp -quiet -q 80 -resize 1600 0 "$f" -o "$out"; then
    rm -f "$f"
    echo "→ $f  ➜  $out"
  fi
done

ls | grep -Ei '\.(jpe?g|png|webp|gif|avif)$' | sort -V | sed 's/.*/"&"/' | paste -sd, - | sed 's/^/[/; s/$/]/' > photos.json
echo "✓ Xong — $(ls | grep -Eic '\.(jpe?g|png|webp|gif|avif)$') ảnh trong img/"
