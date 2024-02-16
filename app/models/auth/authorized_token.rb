module Auth
  class AuthorizedToken < ApplicationRecord
    include Model::AuthorizedToken
    include Wechat::Ext::AuthorizedToken
    include Org::Ext::AuthorizedToken
  end
end
