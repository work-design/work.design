module Auth
  class Account < ApplicationRecord
    include Org::Model::Account
    include Auth::Model::Account
  end
end
