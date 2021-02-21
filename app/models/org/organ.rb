module Org
  class Organ < ApplicationRecord
    include Com::Ext::Taxon
    include Model::Organ
    include Wechat::Model::Organ
    include Roled::Model::User
    include Bench::Model::Organ
  end
end
