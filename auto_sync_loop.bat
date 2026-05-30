@echo off
chcp 65001 > nul
title MarkText笔记自动同步
cd /d F:\GithubNote\AI-Learning-Roadmap

:loop
echo [%date% %time%] 正在检查笔记变化...
git add .
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo 无修改，等待5分钟后再次检查...
) else (
    echo 检测到修改，开始同步...
    git commit -m "auto sync: %date% %time%"
    git push origin main
    echo 同步完成！
)
timeout /t 300 /nobreak > nul
goto loop