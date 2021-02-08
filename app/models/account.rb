class Account < ApplicationRecord
  include Auth::Model::Account
  include Org::Model::Account

end
