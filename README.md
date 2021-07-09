# Work Design
本项目是 [Work Design](https://work.design) 的开源版本，一方面是 Work Design 生态的应用，同时也是组件化开发的示例项目。

## 技术栈
Rails 原教旨主义，善用 Rails Engine，尽可能减少依赖。不仅如此，通过对 Rails 框架的扩展和规范使用，代码量远低于常规 Rails 项目。

* [Ruby On Rails](https://github.com/rails/rails): 最新版本
  * [Turbo](https://turbo.hotwired.dev)
  * [Stimulus](https://stimulus.hotwired.dev)
  * [Viter](https://github.com/qinmingyuan/viter)
* 前端：未采用 jQuery 或其他框架；
  * [Bulma](https://github.com/jgthms/bulma): 纯 CSS 库，需要的 javascript 采用 stimulus 在 [RailsUI](https://github.com/work-design/rails_ui) 项目中实现；
  * [Weui](https://github.com/Tencent/weui)
* 数据库
  * [Postgresql](https://www.postgresql.org)：关系型数据库
  * [Redis](https://redis.io)：内存数据库，用于缓存，队列任务等；

## 准备
* 安装依赖
  * `bundle install`
  * `yarn install`
* 检查配置文件
  * `cp config/credentials/development.yml.enc.example config/credentials/development.yml.enc`
* 数据库准备
  * `cp config/database.yml.example config/database.yml`, 修改配置；
  * `bin/rails db:create`
  * `bin/rails db:schema:load`，因为 migrations 是自动生成的，不太完备，用这个命令准备数据库；
  
## 开发
* `bin/vite` 启动 vite，在启动之前确认下 config/viter.yml 是否已生成，如未生成，可以任一种形式启动下应用，如：`bin/rails c`
* `bin/rails s`

## 依赖及配置

### Redis
* Action Cable: `redis://localhost:6379/1`
* Action Job / Sidekiq: `redis://127.0.0.1:6379/0`(默认)
* Cache: `redis://localhost:6379/2`

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
