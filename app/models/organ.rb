class Organ < ApplicationRecord
  include Com::Ext::Taxon
  include Org::Model::Organ
  include Wechat::Model::Organ
  include Roled::Model::User
  include Bench::Model::Organ
end
