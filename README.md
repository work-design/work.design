# Work Design

[Work Design](https://work.design) 源码，基于[业务组件](https://github.com/work-design/engine)快速开发。

[Work Design 官网](https://work.design) 是服务于 Work Design 生态的应用，也是业务组件化开发的示例项目。

## 主要功能
* 组织管理、OA(办公管理)
* 财务管理
* ERP 供应链管理
* 电商（门店、在线商城、租用、团购）
* CMS 内容管理，基于 Markdown 本地文件
* 通用：权限管理、
* 微信生态

## 技术栈
基于 Ruby On Rails，并通过对 Rails 框架的扩展和微调，使得开发代码量远低于常规 Rails 项目。

* 全栈 MVC 框架：[Ruby On Rails](https://github.com/rails/rails)
* Hotwire：直接传输 HTML 片段
  * [Turbo](https://turbo.hotwired.dev/)
  * [Stimulus](https://stimulus.hotwired.dev)
* 前端 CSS：纯 CSS 库，需要的 javascript 采用 stimulus 在 [RailsDesign](https://github.com/work-design/rails_design) 项目中实现；
  * [Bulma](https://github.com/jgthms/bulma)
* 数据库
  * [Postgresql](https://www.postgresql.org/)：关系型数据库
  * [Sqlite](https://sqlite.org/)
* 队列任务：Solid Queue
* 缓存：Solid Cache
* 服务端推送：Solid Cable

## 准备
* 安装依赖
  * `bundle install`
  * `npm install`
* 检查配置文件
  * `bin/rails credentials:edit`: 修改 db_development, db_test 为你本地数据库
* 数据库准备
  * 修改数据库，数据库格式：postgres://username:password@host:port/database
  * `bin/rails db:create`
  * `bin/rails db:schema:load`，因为 migrations 是自动生成的，不太完备，用这个命令准备数据库；
  
## 开发
* `bin/dev`
* `bin/rails s`

## 依赖及配置


## 基于本项目开展你自己的开发
* Clone 本项目，并丢弃不必要的 git 历史：`git clone --depth 1 git@github.com:work-design/work.design.git your_project`
* 初始化子模块：`git submodule update --init`
* 将所有子模块切换到 main 分支：`git submodule foreach git checkout main`
* 基于当前分开创建新的孤立分支：`git checkout --orphan new-branch`


## 项目发展

#### 资金

* 捐赠：如果你觉得这套系统对您有效，欢迎捐赠;
* 付费： 我们提供付费服务，包括付费咨询，付费安装。

#### 参与

我们鼓励任何人以任何形式参与到本项目的发展当中，包括：
* 成为我们的用户；
* 成为我们的全职职员、兼职职员或者志愿者；
* 投资、捐赠；
* 基于本项目开发自己的项目；

我们也鼓励任何个体在遵从部分限制条件的前提下（需在显眼位置添加基于本项目的说明，具体参见[LICENSE](LICENSE)）基于本项目衍生发展自己的项目。

#### 参与项目开发
* 参见[work.design](https://work.design)

## 其他
* [Work Design 项目说明](https://github.com/work-design/home)
