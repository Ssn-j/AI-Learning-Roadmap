@echo off
chcp 65001 > nul
title MarkText笔记自动同步
cd /d F:\GithubNote\AI-Learning-Roadmap

:loop
echo.
echo ==================================================
echo [%date% %time%] 检查笔记变化...
echo ==================================================

:: 先把所有变化加入暂存
git add . >nul 2>&1

:: 拿到精简状态（脚本友好）
set "changed="
for /f "delims=" %%i in ('git status --porcelain') do (
    set "changed=%%i"
    call :parse_line "%%i"
)

if defined changed (
    echo.
    echo 👉 开始提交并推送...
    git commit -m "auto sync: %date% %time%" >nul 2>&1
    git push origin main
    if !errorlevel! equ 0 (
        echo ✅ 同步完成
    ) else (
        echo ❌ Push失败，等待下一轮重试
    )
) else (
    echo ℹ️ 无修改，等待5分钟...
)

timeout /t 300 /nobreak > nul
goto loop

:: 解析每一行状态
:parse_line
set "line=%~1"
set "flag=!line:~0,2!"
set "file=!line:~2!"

:: 去掉文件名前后空格
for /f "delims=" %%a in ("!file!") do set "file=%%a"

if "!flag!"=="M " (echo 📝 修改：!file!)
if "!flag!"=="A " (echo ✅ 新增：!file!)
if "!flag!"=="D " (echo ❌ 删除：!file!)
if "!flag!"=="??" (echo ➕ 未跟踪：!file!)
goto :eof