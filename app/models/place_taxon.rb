class PlaceTaxon < ApplicationRecord
  include Com::Ext::Taxon
  include Eventual::Model::PlaceTaxon
  include Detail::Model::TaxonModel
end
