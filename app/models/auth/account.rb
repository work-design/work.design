module Auth
  class Account < ApplicationRecord
    include Org::Model::Account
    include Wechat::Model::Account
    include Model::Account
  end
end
