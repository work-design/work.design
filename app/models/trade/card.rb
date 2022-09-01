module Trade
  class Card < ApplicationRecord
    include Model::Card
    include Crm::Ext::Maintainable
  end
end
