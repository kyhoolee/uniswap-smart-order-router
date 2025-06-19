#!/bin/bash

# Đi đến thư mục chứa script
cd "$(dirname "$0")"

# Đường dẫn thư mục gốc của project
ROOT_DIR="../"

# Tên file output
OUTPUT_FILE="combined_smart_order_router.txt"

# Xóa file cũ nếu có
rm -f "$OUTPUT_FILE"

# Tìm tất cả file *.ts trong src/ trừ file test
find "$ROOT_DIR/src" -type f -name "*.ts" ! -name "*.test.ts" | sort | while read filepath; do
    echo "--------------------" >> "$OUTPUT_FILE"
    echo "// FILE: ${filepath#$ROOT_DIR}" >> "$OUTPUT_FILE"
    echo "--------------------" >> "$OUTPUT_FILE"
    cat "$filepath" >> "$OUTPUT_FILE"
    echo -e "\n\n" >> "$OUTPUT_FILE"
done

echo "✅ Đã gom code xong vào: $OUTPUT_FILE"
