import os
import time
import subprocess

# 配置
REPO_PATH = r"F:\GithubNote\AI-Learning-Roadmap"
BRANCH = "main"
CHECK_INTERVAL = 2  # 每2秒检查一次

def run_command(cmd, cwd):
    """执行命令并返回输出"""
    result = subprocess.run(cmd, shell=True, cwd=cwd, capture_output=True, text=True)
    return result.returncode, result.stdout, result.stderr

def sync_git():
    print(f"[{time.ctime()}] 检测到修改，开始同步...")
    # 添加所有文件
    code, out, err = run_command("git add .", REPO_PATH)
    if code != 0:
        print(f"git add 失败: {err}")
        return False
    
    # 提交
    commit_msg = f"auto sync: {time.strftime('%Y-%m-%d %H:%M:%S')}"
    code, out, err = run_command(f'git commit -m "{commit_msg}"', REPO_PATH)
    if code != 0:
        if "nothing to commit" in out or "nothing to commit" in err:
            print("无修改，无需提交")
            return True
        print(f"git commit 失败: {err}")
        return False
    
    # 推送
    code, out, err = run_command(f"git push origin {BRANCH}", REPO_PATH)
    if code != 0:
        print(f"git push 失败: {err}")
        return False
    
    print("同步完成！")
    return True

def main():
    print(f"开始监控目录: {REPO_PATH}")
    print("按 Ctrl+C 停止监控")
    last_modified = {}
    
    try:
        while True:
            # 遍历文件，记录修改时间
            modified = False
            for root, dirs, files in os.walk(REPO_PATH):
                if ".git" in root:
                    continue
                for file in files:
                    if file.endswith(".md") or file.endswith(".png") or file.endswith(".jpg"):
                        filepath = os.path.join(root, file)
                        mtime = os.path.getmtime(filepath)
                        if filepath not in last_modified or last_modified[filepath] != mtime:
                            last_modified[filepath] = mtime
                            modified = True
            
            if modified:
                sync_git()
            
            time.sleep(CHECK_INTERVAL)
    except KeyboardInterrupt:
        print("\n监控已停止")

if __name__ == "__main__":
    main()