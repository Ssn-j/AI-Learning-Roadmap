# FastAPI 框架

## 1. FastAPI 简介

### 1.1 定义

FastAPI 是一个现代、高性能的 Python Web 框架，用于构建 API。它支持自动生成交互式文档、数据验证、异步编程等特性。

使用 Starlette 和 Pydantic 构建，能够自动生成 API 文档并进行数据校验。

### 1.2 特点

FastAPI 之所以在 Python Web 框架中脱颖而出，主要得益于以下特点：

| 特点       | 说明                                                          |
| -------- | ----------------------------------------------------------- |
| **高性能**  | 基于 Starlette 和 Pydantic，性能与 NodeJS 和 Go 相当，是最快的 Python 框架之一 |
| **快速开发** | 开发速度提升约 200%-300%，标准类型声明即可完成数据校验和文档生成                       |
| **减少错误** | 减少约 40% 的人为错误，类型系统自动捕获常见问题                                  |
| **自动文档** | 自动生成交互式 API 文档（Swagger UI 和 ReDoc），无需手动维护                   |
| **类型安全** | 基于标准 Python 类型提示，编辑器提供全面的自动补全和错误检查                          |
| **异步支持** | 原生支持 async/await，可高效处理 IO 密集型任务                             |

### 1.3 适用场景

| 场景        | 说明                               |
| --------- | -------------------------------- |
| 构建 API 后端 | 用于构建 RESTful API，支持前后端分离的 Web 应用 |
| 微服务架构     | 轻量高效，适合作为微服务后端框架                 |
| 数据处理 API  | 适用于接收和返回 JSON 数据的数据处理服务          |
| 实时通信      | 支持 WebSocket，适用于实时通信场景           |
| 机器学习服务    | 可将训练好的模型封装为 API，方便前端和其他服务调用      |

### 1.4 FastAPI 技术栈

FastAPI 构建在两个核心库之上：

| 组件            | 作用       | 说明                                                    |
| ------------- | -------- | ----------------------------------------------------- |
| **Starlette** | Web 框架层  | 提供路由、中间件、WebSocket 等基础 Web 功能，FastAPI 直接继承自 Starlette |
| **Pydantic**  | 数据校验层    | 基于 Python 类型提示进行数据校验、序列化和文档生成                         |
| **Uvicorn**   | ASGI 服务器 | 基于 uvloop 和 httptools 的高性能 ASGI 服务器，用于运行 FastAPI 应用   |

FastAPI 是 Starlette 的子类，因此你可以使用 Starlette 的所有功能。同时 FastAPI 完全兼容 Pydantic，包括基于 Pydantic 的 ORM（如 SQLModel）等外部库。

### 1.5 为什么选择 FastAPI？

| 对比维度 | FastAPI                | Flask      | Django     |
| ---- | ---------------------- | ---------- | ---------- |
| 性能   | 高（异步，ASGI）             | 中（同步，WSGI） | 中（同步，WSGI） |
| 自动文档 | 内置（Swagger UI + ReDoc） | 需第三方扩展     | 需第三方扩展     |
| 类型校验 | 内置（Pydantic）           | 需手动实现      | 需手动实现      |
| 异步支持 | 原生支持                   | 需扩展        | 3.1+ 支持    |
| 学习曲线 | 低                      | 低          | 较高         |
| 适用规模 | 中小型 / 微服务              | 中小型        | 大型 / 全栈    |

## 2. 安装与运行

### 2.1 安装

```bash
pip install fastapi uvicorn
```

- `fastapi`：框架本身

- `uvicorn`：ASGI 服务器，用于运行 FastAPI 应用

### 2.2 最小应用

```python
# main.py

from fastapi import FastAPI
app = FastAPI()
@app.get("/")
def root():
 return {"message": "Hello World"}
```

### 2.3 运行

```bash
# 开发模式（自动重载）
uvicorn main:app --reload

# 生产模式
uvicorn main:app --host 0.0.0.0 --port 8000
```



### 2.4 自动生成的文档

运行后访问：

- Swagger UI：`http://localhost:8000/docs`

- ReDoc：`http://localhost:8000/redoc`

## 3. 路由

路由将 URL 路径和 HTTP 方法映射到处理函数。

### 3.1 基本路由

python

from fastapi import FastAPI
app = FastAPI()
@app.get("/users") # GET 请求
def get_users():
 return [{"name": "张三"}, {"name": "李四"}]
@app.post("/users") # POST 请求
def create_user():
 return {"message": "用户创建成功"}
@app.put("/users/{user_id}") # PUT 请求
def update_user(user_id: int):
 return {"message": f"用户 {user_id} 已更新"}
@app.delete("/users/{user_id}") # DELETE 请求
def delete_user(user_id: int):
 return {"message": f"用户 {user_id} 已删除"}

### 3.2 常用装饰器

| 装饰器             | 对应方法   | 用途     |
| --------------- | ------ | ------ |
| `@app.get()`    | GET    | 获取资源   |
| `@app.post()`   | POST   | 创建资源   |
| `@app.put()`    | PUT    | 完整更新资源 |
| `@app.patch()`  | PATCH  | 部分更新资源 |
| `@app.delete()` | DELETE | 删除资源   |

## 4. 路径参数

路径参数是 URL 路径中的变量部分。

### 4.1 基本用法

python

# 匹配 /users/1、/users/2 等

@app.get("/users/{user_id}")
def get_user(user_id: int):
 return {"user_id": user_id}

### 4.2 多路径参数

python

# 匹配 /users/1/orders/2

@app.get("/users/{user_id}/orders/{order_id}")
def get_order(user_id: int, order_id: int):
 return {"user_id": user_id, "order_id": order_id}

### 4.3 路径参数类型

FastAPI 会根据类型注解自动校验和转换：

| 类型      | 示例                        | 说明         |
| ------- | ------------------------- | ---------- |
| `int`   | `/users/123`              | 自动转为整数     |
| `float` | `/price/99.9`             | 自动转为浮点数    |
| `str`   | `/users/zhangsan`         | 字符串（默认）    |
| `uuid`  | `/items/123e4567-...`     | 校验 UUID 格式 |
| `path`  | `/files/{file_path:path}` | 匹配包含斜杠的路径  |

python

from uuid import UUID
@app.get("/items/{item_id}")
def get_item(item_id: int): # FastAPI 自动将 "123" 转为 123
 return {"item_id": item_id}
@app.get("/files/{file_path:path}")
def get_file(file_path: str):
 return {"file_path": file_path}

# 访问 /files/home/user/data.txt → file_path = "home/user/data.txt"

### 4.4 参数校验

python

from fastapi import Path
@app.get("/items/{item_id}")
def get_item(
 item_id: int = Path(..., title="商品ID", ge=1, le=100)
):
 return {"item_id": item_id}

| 参数    | 说明                            |
| ----- | ----------------------------- |
| `...` | 表示必填（也可以用 `Path(..., min=1)`） |
| `ge`  | 大于等于（greater than or equal）   |
| `le`  | 小于等于（less than or equal）      |
| `gt`  | 大于（greater than）              |
| `lt`  | 小于（less than）                 |

## 5. 查询参数

查询参数是 URL 中 `?` 后面的键值对。

### 5.1 基本用法

python

# 访问 /items?skip=0&limit=10

@app.get("/items")
def get_items(skip: int = 0, limit: int = 10):
 return {"skip": skip, "limit": limit}

### 5.2 可选查询参数

python

from typing import Optional
@app.get("/users")
def get_users(name: Optional[str] = None, age: Optional[int] = None):
 if name:
 return {"message": f"查找名为 {name} 的用户"}
 return {"message": "返回所有用户"}

### 5.3 带默认值

python

@app.get("/products")
def get_products(
 page: int = 1, # 默认值 1
 size: int = 20, # 默认值 20
 sort: str = "-created_at" # 默认排序
):
 return {"page": page, "size": size, "sort": sort}

### 5.4 必填查询参数

python

# 必须提供 keyword 参数，如 /search?keyword=fastapi

@app.get("/search")
def search(keyword: str): # 没有默认值，就是必填
 return {"keyword": keyword}

### 5.5 布尔类型查询参数

python

@app.get("/users")
def get_users(active: bool = True):

# 访问 /users?active=false → active = False

 return {"active": active}

### 5.6 多个相同键的查询参数（列表）

python

from typing import List

# 访问 /items?tag=python&tag=fastapi

@app.get("/items")
def get_items(tag: List[str] = []):
 return {"tags": tag}

## 6. 请求体

请求体是 POST、PUT、PATCH 请求中发送的数据，通常为 JSON 格式。

### 6.1 使用 Pydantic 模型

python

from fastapi import FastAPI
from pydantic import BaseModel
app = FastAPI()

# 定义数据模型

class UserCreate(BaseModel):
 name: str
 age: int
 email: str
@app.post("/users")
def create_user(user: UserCreate):
 return {
 "message": f"用户 {user.name} 创建成功",
 "data": user
 }

### 6.2 请求体 + 路径参数 + 查询参数

python

class ItemCreate(BaseModel):
 name: str
 price: float
@app.post("/users/{user_id}/items")
def create_item(
 user_id: int, # 路径参数
 item: ItemCreate, # 请求体
 token: str = None # 查询参数
):
 return {
 "user_id": user_id,
 "item": item,
 "token": token
 }

### 6.3 Pydantic 模型字段校验

python

from pydantic import BaseModel, Field
from typing import Optional
class UserCreate(BaseModel):
 name: str = Field(..., min_length=1, max_length=50)
 age: int = Field(..., ge=0, le=150)
 email: str = Field(..., regex=r"^\S+@\S+.\S+$")
 description: Optional[str] = Field(None, max_length=200)

| 参数           | 说明      |
| ------------ | ------- |
| `...`        | 必填字段    |
| `None`       | 可选字段    |
| `min_length` | 最小长度    |
| `max_length` | 最大长度    |
| `ge`         | 大于等于    |
| `le`         | 小于等于    |
| `regex`      | 正则表达式校验 |

### 6.4 示例请求

客户端发送的请求：

json

POST /users
Content-Type: application/json
{
 "name": "张三",
 "age": 20,
 "email": "[zhangsan@example.com](mailto:zhangsan@example.com)"
}

## 7. 响应模型

响应模型用于限制 API 返回的数据结构和内容。

### 7.1 基本用法

python

from pydantic import BaseModel
class UserResponse(BaseModel):
 id: int
 name: str
 age: int
class UserCreate(BaseModel):
 name: str
 age: int
@app.post("/users", response_model=UserResponse)
def create_user(user: UserCreate):

# 实际可能返回更多字段，但 response_model 会过滤

 return {
 "id": 1,
 "name": user.name,
 "age": user.age,
 "password": "secret", # 这个字段不会出现在响应中
 "created_at": "2026-06-11" # 这个也不会
 }

### 7.2 响应模型的作用

| 作用       | 说明              |
| -------- | --------------- |
| **数据过滤** | 只返回模型中定义的字段     |
| **数据校验** | 确保返回值符合模型定义     |
| **文档生成** | 在 API 文档中显示响应格式 |
| **类型安全** | IDE 和类型检查工具的支持  |

### 7.3 嵌套响应模型

python

class Item(BaseModel):
 id: int
 name: str
 price: float
class UserResponse(BaseModel):
 id: int
 name: str
 items: List[Item] # 嵌套模型

### 7.4 不同状态码的响应模型

python

@app.post("/users", response_model=UserResponse, status_code=201)
def create_user(user: UserCreate):
 return {"id": 1, "name": user.name, "age": user.age}

### 7.5 只返回部分字段

python

class UserPublic(BaseModel):
 id: int
 name: str

# 不包含 email、password 等敏感信息

@app.get("/users/{user_id}", response_model=UserPublic)
def get_user(user_id: int):
 return {"id": user_id, "name": "张三", "email": "[private@example.com](mailto:private@example.com)"}

## 8. 完整示例：用户管理 API

python

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from typing import List, Optional
app = FastAPI(title="用户管理 API")

# ----- 数据模型 -----

class UserCreate(BaseModel):
 name: str = Field(..., min_length=1, max_length=50)
 age: int = Field(..., ge=0, le=150)
 email: str
class UserUpdate(BaseModel):
 name: Optional[str] = None
 age: Optional[int] = None
 email: Optional[str] = None
class UserResponse(BaseModel):
 id: int
 name: str
 age: int
 email: str

# ----- 模拟数据库 -----

fake_db = {}
current_id = 1

# ----- API 端点 -----

@app.get("/users", response_model=List[UserResponse])
def get_users(skip: int = 0, limit: int = 10):
 """获取用户列表，支持分页"""
 users = list(fake_db.values())
 return users[skip:skip + limit]
@app.get("/users/{user_id}", response_model=UserResponse)
def get_user(user_id: int):
 """根据 ID 获取用户"""
 if user_id not in fake_db:
 raise HTTPException(status_code=404, detail="用户不存在")
 return fake_db[user_id]
@app.post("/users", response_model=UserResponse, status_code=201)
def create_user(user: UserCreate):
 """创建新用户"""
 global current_id
 new_user = {
 "id": current_id,
 "name": user.name,
 "age": user.age,
 "email": user.email
 }
 fake_db[current_id] = new_user
 current_id += 1
 return new_user
@app.put("/users/{user_id}", response_model=UserResponse)
def update_user(user_id: int, user: UserUpdate):
 """完整更新用户"""
 if user_id not in fake_db:
 raise HTTPException(status_code=404, detail="用户不存在")

```
existing = fake_db[user_id]
# 只更新提供的字段
updated = {
    "id": user_id,
    "name": user.name if user.name is not None else existing["name"],
    "age": user.age if user.age is not None else existing["age"],
    "email": user.email if user.email is not None else existing["email"]
}
fake_db[user_id] = updated
return updated
```

@app.delete("/users/{user_id}", status_code=204)
def delete_user(user_id: int):
 """删除用户"""
 if user_id not in fake_db:
 raise HTTPException(status_code=404, detail="用户不存在")
 del fake_db[user_id]

# 状态码 204 没有响应体，所以不返回任何内容

## 9. 快速记忆表

| 概念          | 代码                            | 说明                  |
| ----------- | ----------------------------- | ------------------- |
| 安装          | `pip install fastapi uvicorn` | 安装框架和服务器            |
| 运行          | `uvicorn main:app --reload`   | 开发模式运行              |
| GET 路由      | `@app.get("/path")`           | 处理 GET 请求           |
| POST 路由     | `@app.post("/path")`          | 处理 POST 请求          |
| 路径参数        | `def func(user_id: int)`      | 从 URL 路径获取参数        |
| 查询参数        | `def func(skip: int = 0)`     | 从 URL 查询字符串获取参数     |
| 请求体         | `def func(user: UserModel)`   | 从请求 Body 获取 JSON 数据 |
| Pydantic 模型 | `class User(BaseModel):`      | 定义数据结构              |
| 响应模型        | `response_model=UserModel`    | 限制响应数据格式            |
| HTTP 异常     | `raise HTTPException(...)`    | 返回错误响应              |
| 状态码         | `status_code=201`             | 自定义响应状态码            |
