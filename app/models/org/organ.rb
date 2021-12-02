module Org
  class Organ < ApplicationRecord
    include Model::Organ
    include Com::Ext::Taxon
    include Wechat::Ext::Organ
    include Roled::Ext::Organ
    include Bench::Model::Organ
  end
end
