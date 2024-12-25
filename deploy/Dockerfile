FROM ccr.ccs.tencentyun.com/work-design/ruby:latest AS base

# Rails App 所在位置
WORKDIR /rails
ENV RAILS_ENV='production' BUNDLE_PATH='/usr/local/bundle'

FROM base AS build
RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories
RUN apk update
RUN apk add --update --no-cache build-base libpq-dev gcompat git

# 安装 Ruby 依赖
COPY Gemfile Gemfile.lock ./
COPY vendor/package engine
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com
RUN bundle install && rm -rf ~/.bundle/ ${BUNDLE_PATH}/ruby/*/cache ${BUNDLE_PATH}/ruby/*/bundler/gems/*/.git

COPY . .

FROM base
RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories
RUN apk update
RUN apk add --update --no-cache curl libgit2 poppler-glib vips tzdata libpq-dev fish postgresql16-client git

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

RUN chmod +x deploy/entrypoint_rails.sh

EXPOSE 3000

CMD ["deploy/entrypoint_rails.sh"]
