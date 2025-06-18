#!/bin/bash

cd "$(dirname "$0")"
ROOT_DIR=$(realpath ..)
OUTPUT_FILE="$ROOT_DIR/doc/full_code.txt"
rm -f "$OUTPUT_FILE"

echo "🔍 Bắt đầu gom các file logic chính..."

# Danh sách thư mục / file cần gom
INCLUDE_PATHS=(
    "src/index.ts"
    "src/routers"
    "src/providers"
    "src/util"
    "README.md"
)

# Lọc và gom các file hợp lệ
for path in "${INCLUDE_PATHS[@]}"; do
    find "$ROOT_DIR/$path" \
        -type f \( -name "*.ts" -o -name "*.json" -o -name "*.md" -o -name "*.sol" \) \
        ! -path "*/test*" ! -path "*/types/*" ! -path "*/node_modules/*" \
        | sort \
        | while read -r file; do
            echo "===== FILE: ${file#$ROOT_DIR/} =====" >> "$OUTPUT_FILE"
            cat "$file" >> "$OUTPUT_FILE"
            echo -e "\n\n" >> "$OUTPUT_FILE"
        done
done

echo "✅ Đã gom mã nguồn chính vào: $OUTPUT_FILE"
