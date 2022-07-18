module Profiled
  class Profile < ApplicationRecord
    include Model::Profile
    include Crm::Ext::Client

    store_accessor :extra, :wechat, :major, :degree, :highest_education, :work_experience

  end
end
