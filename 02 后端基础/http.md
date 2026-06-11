# HTTP/HTTPS 协议

HTTP（HyperText Transfer Protocol，超文本传输协议）是 Web 通信的基础。HTTPS 是 HTTP 的安全版本，增加了加密传输。

## 1. 什么是 HTTP/HTTPS

| 协议        | 说明                      | 特点           |
| --------- | ----------------------- | ------------ |
| **HTTP**  | 超文本传输协议，端口80            | 明文传输，速度快但不安全 |
| **HTTPS** | HTTP + SSL/TLS 加密，端口443 | 加密传输，安全但略慢   |
| **        |                         |              |

通俗理解**：

HTTP = 明信片（内容所有人都能看到）

HTTPS = 挂号信（内容加密，只有收信人能看）

## 2.请求方法

| 方法         | 作用     | 场景        | 是否携带 Body |
| ---------- | ------ | --------- | --------- |
| **GET**    | 获取资源   | 查询数据、打开网页 | ❌ 不携带     |
| **POST**   | 创建资源   | 注册用户、提交表单 | ✅ 携带      |
| **PUT**    | 完整更新资源 | 替换整个用户信息  | ✅ 携带      |
| **PATCH**  | 部分更新资源 | 只修改用户的年龄  | ✅ 携带      |
| **DELETE** | 删除资源   | 删除用户      | ❌ 不携带     |

```http
GET  /api/users/1         HTTP/1.1    # 获取 id=1 的用户
POST /api/users           HTTP/1.1    # 创建新用户
PUT  /api/users/1         HTTP/1.1    # 替换 id=1 的用户
PATCH /api/users/1        HTTP/1.1    # 修改 id=1 的用户的部分信息
DELETE /api/users/1       HTTP/1.1    # 删除 id=1 的用户
```

**GET vs POST**：

| 对比    | GET        | POST         |
| ----- | ---------- | ------------ |
| 后退/刷新 | 无影响        | 数据会被重新提交     |
| 书签    | 可以收藏       | 不能收藏         |
| 缓存    | 可以被缓存      | 不能被缓存        |
| 参数位置  | URL 中      | Body 中       |
| 长度限制  | 有（URL长度限制） | 无            |
| 安全性   | 参数暴露在URL中  | 参数在Body中相对安全 |

## 3. 状态码

状态码分为 5 类，首位数字表示类别：

| 分类  | 范围      | 含义            |
| --- | ------- | ------------- |
| 1xx | 100-199 | 信息响应，请求收到继续处理 |
| 2xx | 200-299 | 成功响应          |
| 3xx | 300-399 | 重定向           |
| 4xx | 400-499 | 客户端错误         |
| 5xx | 500-599 | 服务端错误         |

### 常见状态码详解

| 状态码     | 含义                    | 说明       | 场景              |
| ------- | --------------------- | -------- | --------------- |
| **200** | OK                    | 请求成功     | GET/PUT 成功      |
| **201** | Created               | 资源创建成功   | POST 成功创建       |
| **204** | No Content            | 成功但无返回内容 | DELETE 成功       |
| **301** | Moved Permanently     | 永久重定向    | 网站更换域名          |
| **302** | Found                 | 临时重定向    | 未登录跳转到登录页       |
| **304** | Not Modified          | 资源未修改    | 使用缓存            |
| **400** | Bad Request           | 请求参数错误   | 参数格式不对          |
| **401** | Unauthorized          | 未认证      | 未提供或无效的 Token   |
| **403** | Forbidden             | 无权限      | 已认证但权限不足        |
| **404** | Not Found             | 资源不存在    | URL 写错          |
| **405** | Method Not Allowed    | 方法不允许    | 对 GET 接口用了 POST |
| **429** | Too Many Requests     | 请求过多     | 触发限流            |
| **500** | Internal Server Error | 服务器内部错误  | 后端代码异常          |
| **502** | Bad Gateway           | 网关错误     | 代理服务器收到无效响应     |
| **503** | Service Unavailable   | 服务不可用    | 服务器过载或维护        |
| **504** | Gateway Timeout       | 网关超时     | 上游服务器响应超时       |

**记忆技巧**：

- 2xx：成功（2=胜利的手势）

- 3xx：重定向（3=绕路走）

- 4xx：客户端错误（4=是你自己的问题）

- 5xx：服务端错误（5=服务器的问题）

## 4. 请求/响应结构

### 4.1 HTTP 请求结构

```text
请求行：方法 + URL + 版本
请求头（Headers）：键值对，描述请求的附加信息
空行：分隔请求头和请求体
请求体（Body）：实际传输的数据（GET 请求通常没有）
```

**示例**：

```http
POST /api/users HTTP/1.1
Host: api.example.com
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIs...
User-Agent: Mozilla/5.0
{"name": "张三", "age": 20}
```

### 4.2 HTTP 响应结构

```text
状态行：版本 + 状态码 + 状态描述
响应头（Headers）：键值对，描述响应的附加信息
空行：分隔响应头和响应体
响应体（Body）：实际返回的数据
```

**示例**：

```http
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 35
{"id": 1, "name": "张三", "age": 20}
```

### 4.3 常见的请求/响应头

| Header           | 说明               | 示例                 |
| ---------------- | ---------------- | ------------------ |
| `Content-Type`   | 请求/响应的数据格式       | `application/json` |
| `Content-Length` | 请求/响应体的长度        | `35`               |
| `Authorization`  | 认证凭证             | `Bearer token123`  |
| `Cookie`         | 发送服务端存储的Cookie   | `sessionId=abc123` |
| `Set-Cookie`     | 服务端设置Cookie（响应头） | `sessionId=abc123` |
| `User-Agent`     | 客户端信息            | `Mozilla/5.0`      |
| `Accept`         | 客户端期望的响应格式       | `application/json` |
| `Host`           | 请求的目标主机          | `api.example.com`  |

### 4.4 Cookie 和 Token 对比

| 特性   | Cookie      | Token（如 JWT）         |
| ---- | ----------- | -------------------- |
| 存储位置 | 浏览器自动存储     | 前端手动存储（localStorage） |
| 发送方式 | 浏览器自动携带     | 前端手动放入 Header        |
| 状态   | 服务端需要存储状态   | 服务端无状态               |
| 跨域   | 受限制         | 方便                   |
| 移动端  | 不支持         | 支持                   |
| 安全性  | 较低（容易 CSRF） | 较高                   |

## 5. RESTful API

REST（Representational State Transfer）是一套 API 设计规范。

### 5.1 核心原则

| 原则            | 说明                     |
| ------------- | ---------------------- |
| **资源导向**      | 使用名词表示资源，不用动词          |
| **HTTP 方法语义** | 用正确的方法表达操作意图           |
| **状态码语义**     | 用正确的状态码表达响应结果          |
| **无状态**       | 每个请求包含完整信息，服务端不存储客户端状态 |
| **统一接口**      | 使用标准 HTTP 方法           |

### 5.2 资源命名规范

| 风格   | 示例                        | 说明     |
| ---- | ------------------------- | ------ |
| ✅ 推荐 | `/users`、`/orders`        | 使用名词复数 |
| ✅ 推荐 | `/users/123/orders`       | 表示嵌套资源 |
| ❌ 避免 | `/getUsers`、`/createUser` | 不要使用动词 |
| ❌ 避免 | `/userList`               | 不要使用驼峰 |

### 5.3 RESTful API 设计示例

| 操作     | HTTP 方法 | URL        | 请求体    | 响应           |
| ------ | ------- | ---------- | ------ | ------------ |
| 获取用户列表 | GET     | `/users`   | 无      | 200 + 用户列表   |
| 获取单个用户 | GET     | `/users/1` | 无      | 200 + 用户信息   |
| 创建用户   | POST    | `/users`   | 用户信息   | 201 + 创建的用户  |
| 完整更新用户 | PUT     | `/users/1` | 完整用户信息 | 200 + 更新后的用户 |
| 部分更新用户 | PATCH   | `/users/1` | 要修改的字段 | 200 + 更新后的用户 |
| 删除用户   | DELETE  | `/users/1` | 无      | 204（无内容）     |

### 5.4 过滤、排序、分页

通过查询参数（Query String）实现：

text

# 过滤：只获取活跃用户

GET /users?status=active

# 排序：按年龄降序

GET /users?sort=-age

# 分页：每页20条，第3页

GET /users?page=3&size=20

# 组合

GET /users?status=active&sort=-age&page=1&size=20

## 6. 实际应用场景

### 场景1：调用第三方 API

python

import requests

# GET 请求

response = requests.get("https://api.example.com/users/1")
if response.status_code == 200:
    user = response.json()
    print(user["name"])

# POST 请求

data = {"name": "张三", "age": 20}
response = requests.post(
    "https://api.example.com/users",
    json=data,  # 自动设置 Content-Type: application/json
    headers={"Authorization": "Bearer token123"}
)

### 场景2：RESTful API 的错误处理

python

def call_api(url):
    response = requests.get(url)

    if response.status_code == 200:
        return response.json()
    elif response.status_code == 400:
        print("请求参数错误")
    elif response.status_code == 401:
        print("未认证，请重新登录")
    elif response.status_code == 403:
        print("无权限访问")
    elif response.status_code == 404:
        print("资源不存在")
    elif response.status_code == 429:
        print("请求过于频繁，请稍后重试")
    elif 500 <= response.status_code < 600:
        print("服务器错误，请稍后重试")
    else:
        print(f"未知错误: {response.status_code}")
    
    return None

### 场景3：AI API 调用中的 HTTP 请求

python

import requests
import os
DEEPSEEK_API_KEY = os.getenv("DEEPSEEK_API_KEY")
DEEPSEEK_URL = "https://api.deepseek.com/v1/chat/completions"
headers = {
    "Authorization": f"Bearer {DEEPSEEK_API_KEY}",
    "Content-Type": "application/json"
}
data = {
    "model": "deepseek-chat",
    "messages": [{"role": "user", "content": "你好"}],
    "temperature": 0.7
}
response = requests.post(DEEPSEEK_URL, headers=headers, json=data)
if response.status_code == 200:
    result = response.json()
    print(result["choices"][0]["message"]["content"])
elif response.status_code == 401:
    print("API Key 无效")
elif response.status_code == 429:
    print("请求次数超限")
else:
    print(f"错误: {response.status_code}")

## 7. 面试常见问题

**Q1：GET 和 POST 有什么区别？**

> GET 用于获取资源，参数在 URL 中，可以被缓存；POST 用于创建资源，参数在 Body 中，不可被缓存。GET 有长度限制，POST 没有。

**Q2：301 和 302 有什么区别？**

> 301 是永久重定向，搜索引擎会更新为新的 URL；302 是临时重定向，搜索引擎仍保留原 URL。301 会被浏览器强缓存，302 不会。

**Q3：401 和 403 有什么区别？**

> 401 表示未认证，用户没登录或 token 无效，通常提示登录。403 表示已认证但无权限，比如普通用户访问管理员接口。

**Q4：RESTful API 的核心原则是什么？**

> 资源导向，用名词表示资源；使用 HTTP 方法表达操作语义；使用状态码表达响应结果；服务端无状态。

**Q5：Cookie 和 Token 有什么区别？**

> Cookie 由浏览器自动管理和发送，服务端需要存储状态；Token 由前端手动存储和发送，服务端无状态，更适合移动端和跨域场景。

## 8. 快速记忆表

### 请求方法

| 方法     | 用途   | Body |
| ------ | ---- | ---- |
| GET    | 获取资源 | ❌    |
| POST   | 创建资源 | ✅    |
| PUT    | 完整更新 | ✅    |
| DELETE | 删除资源 | ❌    |

### 状态码

| 分类  | 代表              | 含义    |
| --- | --------------- | ----- |
| 2xx | 200             | 成功    |
| 3xx | 301/302         | 重定向   |
| 4xx | 400/401/403/404 | 客户端错误 |
| 5xx | 500             | 服务端错误 |

### RESTful 原则

| 原则      | 说明                |
| ------- | ----------------- |
| 资源命名    | 使用名词复数，如 `/users` |
| HTTP 方法 | 用方法表达操作意图         |
| 状态码     | 用状态码表达结果          |
| 无状态     | 每个请求独立            |
