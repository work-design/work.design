class ApplicationMailbox < ActionMailbox::Base
  routing ->(email) { email.mail.from.end_with?('<weixinteam@qq.com>') } => :wechat
end
