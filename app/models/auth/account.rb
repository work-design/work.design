module Auth
  class Account < ApplicationRecord
    include Org::Model::Account
    include Model::Account
  end
end
