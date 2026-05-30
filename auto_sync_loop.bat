@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul
title MarkText笔记自动同步
cd /d F:\GithubNote\AI-Learning-Roadmap

:loop
echo.
echo ==================================================
echo [%date% %time%] 检查笔记变化...
echo ==================================================

:: 1. 添加所有修改
git add . >nul 2>&1

:: 2. 解析并打印文件变化
set "changed_count=0"
for /f "delims=" %%i in ('git status --porcelain') do (
    set /a changed_count+=1
    set "line=%%i"
    set "flag=!line:~0,2!"
    set "file=!line:~2!"
    for /f "delims=" %%a in ("!file!") do set "file=%%a"
    
    if "!flag!"=="M " (echo 📝 修改：!file!)
    if "!flag!"=="A " (echo ✅ 新增：!file!)
    if "!flag!"=="D " (echo ❌ 删除：!file!)
    if "!flag!"=="??" (echo ➕ 未跟踪：!file!)
)

:: 3. 有修改则提交并推送
if !changed_count! gtr 0 (
    echo.
    echo 👉 开始提交并推送...
    git commit -m "auto sync: %date% %time%" >nul 2>&1
    git push origin main
    if %errorlevel% equ 0 (
        echo.
        echo ✅ 同步完成！
    ) else (
        echo.
        echo ❌ Push失败，等待下一轮重试...
    )
) else (
    echo ℹ️ 无修改，等待5分钟...
)

timeout /t 300 /nobreak > nul
goto loop