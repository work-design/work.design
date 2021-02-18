class Place < ApplicationRecord
  include Event::Model::Place
  include Detail::Model::ItemModel
end
