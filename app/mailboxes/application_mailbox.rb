class ApplicationMailbox < ActionMailbox::Base
  routing ->(email) { email.mail.from.end_with?('<weixinmphelper@tencent.com>') } => :wechat
end
