module Auth
  class Account < ApplicationRecord
    include Model::Account
    include Org::Model::Account
    include Wechat::Ext::Account
    include Profiled::Ext::Account
  end
end
