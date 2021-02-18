class Place < ApplicationRecord
  include Eventual::Model::Place
  include Detail::Model::ItemModel
end
