class Profile < ApplicationRecord
  include Profile::Model::Profile
  include RailsAgency::Client

  store_accessor :extra, :wechat, :major, :degree, :highest_education, :work_experience

end
