@echo off
chcp 65001 > nul
cd /d F:\GithubNote\AI-Learning-Roadmap
:: 只在有修改时提交，没修改就跳过
git add .
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo 无修改，无需同步
    exit
)
git commit -m "auto sync: %date% %time%"
git push origin main