echo '```' > README.md
tree -L 10 -I '__pycache__|__init__.py' >> README.md
echo '```' >> README.md

git add .
git commit -m "auto commit"
git push


