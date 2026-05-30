@echo off
chcp 65001 > nul
title MarkText笔记自动同步
cd /d F:\GithubNote\AI-Learning-Roadmap

:loop
echo [%date% %time%] 正在检查笔记变化...

:: 1. 添加所有修改
git add . >nul 2>&1

:: 2. 检查是否有变更
git status --porcelain | findstr /r "^[AMDR]" >nul
if %errorlevel% equ 0 (
    echo 检测到修改，开始同步...
    git commit -m "auto sync: %date% %time%" >nul 2>&1
    :: 重试 push 3 次，确保提交成功
    git push origin main >nul 2>&1
    if %errorlevel% equ 0 (
        echo 同步完成！
    ) else (
        echo 同步失败，等待下一次循环重试...
    )
) else (
    echo 无修改，等待5分钟后再次检查...
)

timeout /t 300 /nobreak > nul
goto loop