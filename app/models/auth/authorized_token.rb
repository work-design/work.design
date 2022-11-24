module Auth
  class AuthorizedToken < ApplicationRecord
    include Model::AuthorizedToken
    include Wechat::Ext::AuthorizedToken
  end
end
