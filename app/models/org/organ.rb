module Org
  class Organ < ApplicationRecord
    include Model::Organ
    include Com::Ext::Taxon
    include Roled::Ext::Organ
    include Bench::Ext::Organ
    include Wechat::Ext::Organ
    include Trade::Ext::Organ
  end
end
