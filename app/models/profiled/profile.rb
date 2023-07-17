module Profiled
  class Profile < ApplicationRecord
    include Model::Profile
    include Crm::Ext::Client
    include Crm::Ext::Agent
    include Wechat::Ext::Profile

    store_accessor :extra, :wechat, :major, :degree, :highest_education, :work_experience

  end
end
