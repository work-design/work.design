module Eventual
  class Place < ApplicationRecord
    include Model::Place
    include Detail::Model::ItemModel
  end
end
