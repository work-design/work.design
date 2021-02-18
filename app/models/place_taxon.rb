class PlaceTaxon < ApplicationRecord
  include Com::Ext::Taxon
  include Event::Model::PlaceTaxon
  include Detail::Model::TaxonModel
end
