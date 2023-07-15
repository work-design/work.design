module Trade
  class Item < ApplicationRecord
    include Model::Item
    include Job::Ext::Jobbed
    include Ship::Ext::Item
    include Bench::Ext::Item
    include Factory::Ext::Item
    include Space::Ext::Item
    include JiaBo::Ext::Device

  end
end
