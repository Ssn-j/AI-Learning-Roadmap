# AI-Learning-Roadmap
记录我的AI应用开发学习路线

## 🗺️ 核心学习路线

### 第一阶段：打好地基
- [ ] **Python核心编程**
    - [ ] 基础语法、流程控制
    - [ ] 核心数据结构：列表、字典、元组、集合
    - [ ] 函数、类与面向对象编程
    - [ ] 常用内置库：os, sys, json, datetime
- [ ] **开发工具链**
    - [ ] Git与GitHub：版本控制，每日Commit习惯
    - [ ] VS Code：配置Python开发环境，AI编程插件(如Codeium/CodeBuddy)

### 第二阶段：后端基础 
- [ ] **Web开发基础**
    - [ ] HTTP/HTTPS协议：请求/响应结构、状态码含义
    - [ ] FastAPI/Flask框架：开发RESTful API
- [ ] **数据库与SQL**
    - [ ] SQL基础：SELECT, JOIN, GROUP BY
    - [ ] 关系型数据库：MySQL
    - [ ] 数据库设计基础

### 第三阶段：AI应用开发核心
- [ ] **大模型基础原理**
    - [ ] Transformer、Token、上下文窗口、Temperature等核心概念
- [ ] **Prompt工程**
    - [ ] Zero-shot, Few-shot, CoT（思维链）等技巧
- [ ] **AI API调用**
    - [ ] 熟练调用DeepSeek/OpenAI API，掌握同步/异步请求
- [ ] **RAG技术 (重中之重)**
    - [ ] 完整理解RAG工作流：文档加载 → 切片 → 向量化 → 检索 → 生成
    - [ ] LangChain基础：LCEL、Chain、Retriever
    - [ ] 向量数据库：Chroma, FAISS
    - [ ] Embedding模型：文本向量化与余弦相似度
- [ ] **Agent基础 (加分项)**
    - [ ] ReAct模式：理解Thought -> Action -> Observation循环
    - [ ] Function Calling / Tool Use：让模型调用外部工具

### 第四阶段：实战项目
- [ ] **项目一：【必做】个人RAG知识库问答系统**
    - [ ] 实现功能：用户上传文档(PDF/TXT) -> AI基于文档内容回答问题
    - [ ] 技术栈：Python + DeepSeek API + LangChain + Chroma + Gradio
    - [ ] 目标产出：部署在HuggingFace Spaces的在线Demo + 完整代码仓库
- [ ] **项目二：【选做】AI智能助手 (Agent应用)**
    - [ ] 实现功能：一个能查询天气、搜索信息的多工具助手
    - [ ] 技术栈：LangGraph + FastAPI + Function Calling

## 📅 学习进度跟踪
| 周次 | 学习重点 | 代码产出 |
| :--- | :--- | :--- |
| 第1周 | Python基础与Git | [学习笔记链接] |
| 第2周 | Python数据结构与面向对象 | [代码仓库链接] |
| ... | ... | ... |
| 第X周 | **完成RAG项目并部署上线** | **[项目Demo链接]** |

## 🔗 资源推荐
- **学习平台**：菜鸟教程、B站、Python123
- **技术文档**：DeepSeek/LangChain官方文档
- **练习网站**：牛客网、LeetCode

## 💪 我的信念
> 我不是在‘准备’成为一个AI应用开发者，我现在就是。
> 这个GitHub仓库，就是我的作品集，是我学习能力、技术热情和工程素养的证明。
