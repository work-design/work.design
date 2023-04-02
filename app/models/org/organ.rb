module Org
  class Organ < ApplicationRecord
    include Model::Organ
    include Com::Ext::Taxon
    include Roled::Ext::Organ
    include Bench::Model::Organ
    include Wechat::Ext::Organ
  end
end
