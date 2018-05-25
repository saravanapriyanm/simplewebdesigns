cat common.json index.json > temp.json && ^
mustache temp.json index.mustache -p header.mustache -p footer.mustache output\index.html && ^
cat common.json about.json > temp.json && ^
mustache temp.json about.mustache -p header.mustache -p footer.mustache output\about.html