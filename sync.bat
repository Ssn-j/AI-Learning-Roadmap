@echo off
:: 切换到仓库目录
cd /d F:\GithubNote\AI-Learning-Roadmap

:: 添加所有修改
git add .

:: 提交（用当前时间作为备注）
git commit -m "auto sync: %date% %time%"

:: 推送到GitHub
git push origin master

echo 同步完成！按任意键关闭窗口...
pause > nul