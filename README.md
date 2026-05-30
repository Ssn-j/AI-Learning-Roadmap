# AI-Learning-Roadmap

记录我的AI应用开发学习路线

## 1 GitHub笔记目录结构

AI-Learning-Roadmap/
│
├── README.md                    # 总览：学习路线图 + 进度跟踪
│
├── 01-python-basics/            # 第一阶段：Python核心编程
│   ├── 01-syntax.md             # 基础语法、流程控制
│   ├── 02-data-structures.md    # 列表、字典、元组、集合
│   ├── 03-functions.md          # 函数
│   ├── 04-oop.md                # 类与面向对象
│   └── 05-builtin-libraries.md  # os, sys, json, datetime
│
├── 02-dev-tools/                # 第一阶段：开发工具链
│   ├── 01-git.md                # Git与GitHub
│   └── 02-vscode.md             # VS Code配置与插件
│
├── 03-backend-basics/           # 第二阶段：后端基础
│   ├── 01-http.md               # HTTP/HTTPS协议
│   ├── 02-fastapi.md            # FastAPI框架
│   ├── 03-sql.md                # SQL基础
│   ├── 04-mysql.md              # MySQL数据库
│   └── 05-database-design.md    # 数据库设计基础
│
├── 04-ai-core/                  # 第三阶段：AI应用开发核心
│   ├── 01-llm-basics.md         # 大模型基础原理
│   ├── 02-prompt-engineering.md # Prompt工程
│   ├── 03-api-call.md           # AI API调用
│   ├── 04-rag.md                # RAG技术（重点）
│   ├── 05-langchain.md          # LangChain框架
│   ├── 06-vector-db.md          # 向量数据库
│   ├── 07-embedding.md          # Embedding模型
│   └── 08-agent.md              # Agent基础（加分项）
│
└── projects/                    # 项目代码
    └── rag-knowledge-base/      # RAG知识库问答系统
        ├── README.md
        ├── app.py
        └── requirements.txt 

## 2 各阶段具体学习内容

### 第一阶段：Python核心编程

#### 01-syntax.md（基础语法、流程控制）

| 知识点               | 具体内容                                                            | 掌握程度   |
| ----------------- | --------------------------------------------------------------- | ------ |
| 变量与赋值             | <mark>命名规则</mark>、`a = 10`                                      | 会用     |
| 数字类型              | `int`、`float`                                                   | 会用     |
| 字符串               | 定义、拼接、索引、切片、`len()`、`split()`、`join()`、`strip()`、f-string       | **熟练** |
| 布尔类型              | `True`、`False`                                                  | 会用     |
| 类型转换              | `int()`、`str()`、`float()`                                       | 会用     |
| 运算符               | 算术、比较(`==` `!=`)、逻辑(`and` `or` `not`)、成员(`in`)                  | **熟练** |
| 条件判断              | `if`/`elif`/`else`                                              | **熟练** |
| for循环             | `for item in list`、`for i in range()`、`for k,v in dict.items()` | **熟练** |
| while循环           | `while condition:`                                              | 会用     |
| break/continue    | 跳出循环、跳过本次                                                       | 会用     |
| 输入输出              | `print()`、`input()`                                             | 会用     |
| <mark>异常处理</mark> | `try`/`except`、常见异常类型                                           | 会用     |

#### 02-data-structures.md（核心数据结构）

| 知识点    | 具体内容                                         | 掌握程度   |
| ------ | -------------------------------------------- | ------ |
| **列表** | 创建、增删改查、切片、列表推导式、`append()`、`pop()`、`sort()` | **熟练** |
| **字典** | 创建、增删改查、`get()`安全取值、`items()`遍历、字典推导式        | **熟练** |
| **元组** | 创建、不可变特性、解包                                  | 理解     |
| **集合** | 创建、去重、并集`\|`、交集`&`、差集`-`                     | 会用     |

- [x] #### 03-functions.md（函数）

| 知识点    | 具体内容                               | 掌握程度   |
| ------ | ---------------------------------- | ------ |
| 定义函数   | `def`、函数名、参数、`return`              | **熟练** |
| 参数类型   | 位置参数、默认参数、关键字参数、`*args`、`**kwargs` | **熟练** |
| 作用域    | 局部变量、全局变量、`global`                 | 理解     |
| lambda | `lambda x: x*2`                    | 会用     |
| 文档字符串  | `"""说明"""`                         | 了解     |

- [x] #### 04-oop.md（类与面向对象）

| 知识点  | 具体内容                                       | 掌握程度   |
| ---- | ------------------------------------------ | ------ |
| 类与对象 | `class`、`__init__`、`self`、实例化              | **熟练** |
| 实例方法 | 第一个参数是`self`                               | **熟练** |
| 类属性  | 所有实例共享                                     | 理解     |
| 继承   | `class Child(Parent)`、`super().__init__()` | 理解     |
| 封装   | `@property`、私有属性`__xxx`                    | 了解     |
| 特殊方法 | `__str__`、`__repr__`                       | 了解     |

#### 05-builtin-libraries.md（常用内置库）

| 库          | 常用功能                                          | 掌握程度   |
| ---------- | --------------------------------------------- | ------ |
| `os`       | `os.path.join()`、`os.listdir()`、`os.getcwd()` | 会用     |
| `sys`      | `sys.argv`（命令行参数）、`sys.path`                  | 了解     |
| `json`     | `json.loads()`、`json.dumps()`、文件读写            | **熟练** |
| `datetime` | `datetime.now()`、字符串与时间互转                     | 会用     |

---

### 第一阶段：开发工具链

#### 01-git.md（Git与GitHub）

| 知识点        | 具体内容                                                       | 掌握程度   |
| ---------- | ---------------------------------------------------------- | ------ |
| 基本命令       | `git init`、`git add`、`git commit -m`、`git push`、`git pull` | **熟练** |
| 分支管理       | `git branch`、`git checkout`、`git merge`                    | 会用     |
| 远程仓库       | `git remote`、连接GitHub                                      | 会用     |
| 克隆         | `git clone`                                                | 会用     |
| .gitignore | 忽略不需要提交的文件                                                 | 了解     |
| 每日Commit   | 保持绿点习惯                                                     | **养成** |

---

### 第二阶段：后端基础

#### 01-http.md（HTTP/HTTPS协议）

| 知识点         | 具体内容                                                                          | 掌握程度   |
| ----------- | ----------------------------------------------------------------------------- | ------ |
| 请求方法        | GET、POST、PUT、DELETE                                                           | **熟练** |
| 状态码         | 200（成功）、301/302（重定向）、400（客户端错误）、401（未认证）、403（无权限）、404（找不到）、429（限流）、500（服务器错误） | **熟练** |
| 请求/响应结构     | Header、Body、Cookie、Token                                                      | 理解     |
| RESTful API | 设计规范、资源命名                                                                     | 理解     |

#### 02-fastapi.md（FastAPI框架）

| 知识点   | 具体内容                                                      | 掌握程度   |
| ----- | --------------------------------------------------------- | ------ |
| 安装与运行 | `pip install fastapi uvicorn`、`uvicorn main:app --reload` | 会用     |
| 路由    | `@app.get("/")`、`@app.post("/items")`                     | **熟练** |
| 路径参数  | `/items/{item_id}`                                        | 会用     |
| 查询参数  | `?name=张三&age=20`                                         | 会用     |
| 请求体   | `@app.post("/items")` + `Body`                            | 会用     |
| 响应模型  | `response_model`                                          | 了解     |

#### 03-sql.md（SQL基础）

| 知识点  | 具体内容                                      | 掌握程度   |
| ---- | ----------------------------------------- | ------ |
| 查询   | `SELECT * FROM table`、`SELECT col1, col2` | **熟练** |
| 条件过滤 | `WHERE`、`AND`、`OR`、`IN`、`LIKE`            | **熟练** |
| 排序   | `ORDER BY`、`ASC`/`DESC`                   | 会用     |
| 分组   | `GROUP BY`、`HAVING`                       | 会用     |
| 聚合函数 | `COUNT`、`SUM`、`AVG`、`MAX`、`MIN`           | **熟练** |
| 连接   | `INNER JOIN`、`LEFT JOIN`                  | **熟练** |
| 插入   | `INSERT INTO`                             | 会用     |
| 更新   | `UPDATE`                                  | 会用     |
| 删除   | `DELETE FROM`                             | 会用     |

#### 04-mysql.md（MySQL数据库）

| 知识点      | 具体内容                              | 掌握程度 |
| -------- | --------------------------------- | ---- |
| 安装与连接    | 本地安装、命令行连接、GUI工具（Navicat/DBeaver） | 会用   |
| Python连接 | `pip install pymysql`、连接池         | 会用   |

#### 05-database-design.md（数据库设计基础）

| 知识点   | 具体内容                             | 掌握程度 |
| ----- | -------------------------------- | ---- |
| 主键与外键 | 唯一标识、表间关联                        | 理解   |
| 索引    | 加速查询、`CREATE INDEX`              | 理解   |
| 三大范式  | 减少冗余的设计原则                        | 了解   |
| 用户表设计 | id、username、password、create_time | 能用   |

---

### 第三阶段：AI应用开发核心

![](F:\githubMd\images\2026-05-29-09-59-18-image.png)

#### 01-llm-basics.md（大模型基础原理）

## 一、`01-llm-basics.md` 完整内容（补充版）

除了你列出的6个知识点，大模型基础原理还包括以下内容：

| 序号  | 知识点                   | 具体内容                             | 掌握程度   | 补充说明         |
| --- | --------------------- | -------------------------------- | ------ | ------------ |
| 1   | **什么是大模型**            | 参数量大（10亿+）、涌现能力                  | 理解概念   | 区别于传统小模型     |
| 2   | **LLM的工作方式**          | 自回归生成（逐个预测下一个token）              | 理解概念   | GPT系列的本质     |
| 3   | **训练三阶段**             | 预训练 → 监督微调(SFT) → 人类反馈强化学习(RLHF) | 了解     | 面试偶尔会问       |
| 4   | **Embedding**         | 文本→向量、语义表示                       | 理解概念   | RAG的基础       |
| 5   | **Tokenization**      | 分词方式（BPE、WordPiece）              | 了解     | 不同模型分词不同     |
| 6   | **Transformer**       | 骨架架构、编码器-解码器                     | 理解概念   | ✓ 你已有        |
| 7   | **注意力机制**             | Q/K/V、自注意力、多头注意力                 | 理解概念   | ✓ 你已有        |
| 8   | **Token**             | 最小语义单位、计价单位                      | **熟练** | ✓ 你已有        |
| 9   | **上下文窗口**             | 能记住的Token上限                      | **熟练** | ✓ 你已有        |
| 10  | **Temperature**       | 控制随机性                            | **熟练** | ✓ 你已有        |
| 11  | **Top_p / Top_k**     | 采样参数                             | 了解     | ✓ 你已有        |
| 12  | **幻觉(Hallucination)** | 模型编造事实                           | 理解概念   | 面试常问（如何减少幻觉） |
| 13  | **对齐(Alignment)**     | 让模型输出符合人类价值观                     | 了解     | RLHF的目的      |
| 14  | **GPT vs BERT**       | 生成式 vs 理解式                       | 了解     | 两类模型的区别      |

做笔记的顺序，应该遵循 **“先宏观，再微观，先基础，再深入”** 的原则。

### 推荐顺序（7步法）

| 步骤      | 知识点                     | 理由                   |
| ------- | ----------------------- | -------------------- |
| **第1步** | 什么是大模型、LLM的工作方式         | 建立宏观认知：这东西是什么？怎么工作的？ |
| **第2步** | Transformer、注意力机制       | 理解底层架构：为什么它能工作？      |
| **第3步** | Token、Tokenization      | 理解输入输出：模型看到的是什么？     |
| **第4步** | 上下文窗口                   | 理解限制：它能记住多少？         |
| **第5步** | Temperature、Top_p、Top_k | 理解输出控制：怎么让它听话？       |
| **第6步** | Embedding               | 为RAG打基础：怎么做检索？       |
| **第7步** | 幻觉、对齐、GPT vs BERT       | 扩展知识：面试加分项           |

#### 02-prompt-engineering.md（Prompt工程）

| 知识点       | 具体内容               | 掌握程度   |
| --------- | ------------------ | ------ |
| Zero-shot | 不给例子，直接问           | **熟练** |
| Few-shot  | 给3-5个例子，让模型模仿      | **熟练** |
| 链式思考(CoT) | 让模型一步步推理           | **熟练** |
| 角色扮演      | 设定身份（你是面试官/你是客服）   | 会用     |
| 结构化Prompt | 用Markdown/JSON组织指令 | 会用     |

#### 03-api-call.md（AI API调用）

| 知识点       | 具体内容              | 掌握程度   |
| --------- | ----------------- | ------ |
| API Key认证 | 环境变量存储、Header传递   | **熟练** |
| 同步调用      | 请求后等待结果           | **熟练** |
| 异步调用      | 不阻塞主线程            | 了解     |
| 流式输出      | 逐字返回、提升体验         | 会用     |
| 超时与重试     | 网络问题处理、指数退避       | 会用     |
| 错误码处理     | 4xx客户端错误、5xx服务端错误 | 会用     |

#### 04-rag.md（RAG技术 - 重中之重）

| 知识点    | 具体内容                        | 掌握程度   |
| ------ | --------------------------- | ------ |
| RAG工作流 | 文档加载 → 切片 → 向量化 → 检索 → 生成   | **熟练** |
| 文档加载   | 读PDF、TXT、Word               | 会用     |
| 文本切分   | `chunk_size`、`overlap`、切分策略 | **熟练** |
| 向量化    | 文本→向量、Embedding模型           | 理解     |
| 检索     | 相似度搜索、Top-K                 | **熟练** |
| 生成     | 拼接检索结果+用户问题 → LLM回答         | **熟练** |

#### 05-langchain.md（LangChain框架）

| 知识点            | 具体内容                | 掌握程度   |
| -------------- | ------------------- | ------ |
| LCEL           | LangChain表达式语法、链式调用 | 会用     |
| DocumentLoader | 加载各种格式文档            | 会用     |
| TextSplitter   | 文本切分器               | 会用     |
| VectorStore    | 向量数据库接口             | 会用     |
| RetrievalQA    | 检索增强问答链             | **熟练** |

#### 06-vector-db.md（向量数据库）

| 知识点    | 具体内容          | 掌握程度   |
| ------ | ------------- | ------ |
| Chroma | 轻量级、本地运行、适合学习 | **熟练** |
| FAISS  | Meta开源、本地高效检索 | 了解     |
| Milvus | 生产级、分布式       | 了解     |

#### 07-embedding.md（Embedding模型）

| 知识点   | 具体内容                    | 掌握程度 |
| ----- | ----------------------- | ---- |
| 什么是向量 | 数字列表、高维空间中的点            | 理解   |
| 文本向量化 | 文本 → Embedding模型 → 向量   | 理解   |
| 余弦相似度 | 计算两个向量的相似程度             | 理解   |
| 模型选型  | BGE（中文）、OpenAI、text2vec | 会用   |

#### 08-agent.md（Agent基础 - 加分项）

| 知识点              | 具体内容                              | 掌握程度 |
| ---------------- | --------------------------------- | ---- |
| ReAct模式          | Thought → Action → Observation 循环 | 理解   |
| Function Calling | 让模型声明要调用的工具                       | 会用   |
| Tool Use         | 模型调用外部API（查天气、搜网页）                | 会用   |

## 3 资源汇总表（按平台分类）

| 平台/类型        | 可学内容                           | 网址/获取方式                                             |
| ------------ | ------------------------------ | --------------------------------------------------- |
| **菜鸟教程**     | Python基础、SQL、Git、HTTP          | [runoob.com](https://runoob.com/)                   |
| **B站**       | Python视频、LangChain、Prompt工程    | [bilibili.com](https://bilibili.com/)               |
| **官方文档**     | FastAPI、LangChain、DeepSeek API | 各官网                                                 |
| **百度开发者中心**  | RAG、AI智能体、LangChain进阶          | [developer.baidu.com](https://developer.baidu.com/) |
| **牛客网**      | SQL实战、Python练习题                | [nowcoder.com](https://nowcoder.com/)               |
| **国家高等教育平台** | MySQL数据库课程                     | [chinaooc.com.cn](https://chinaooc.com.cn/)         |
| **书籍**       | Python、FastAPI、MySQL           | 出版社/图书馆                                             |
| **交互式平台**    | Git、Python入门                   | [codecademy.com](https://codecademy.com/)           |

## 4 🗺️ 核心学习路线

### 第一阶段：打好地基

- [ ] **Python核心编程**
  - [x] 基础语法、流程控制
  - [ ] 核心数据结构：列表、字典、元组、集合
  - [x] 函数、类与面向对象编程
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

| 周次  | 学习重点             | 代码产出           |
|:--- |:---------------- |:-------------- |
| 第1周 | Python基础与Git     | [学习笔记链接]       |
| 第2周 | Python数据结构与面向对象  | [代码仓库链接]       |
| ... | ...              | ...            |
| 第X周 | **完成RAG项目并部署上线** | **[项目Demo链接]** |

## 🔗 资源推荐

- **学习平台**：菜鸟教程、B站、Python123
- **技术文档**：DeepSeek/LangChain官方文档
- **练习网站**：牛客网、LeetCode

## 💪 我的信念

> 我不是在‘准备’成为一个AI应用开发者，我现在就是。
> 这个GitHub仓库，就是我的作品集，是我学习能力、技术热情和工程素养的证明。
