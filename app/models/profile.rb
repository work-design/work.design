class Profile < ApplicationRecord
  include RailsProfile::Profile
  include RailsAgency::Client

  store_accessor :extra, :wechat, :major, :degree, :highest_education, :work_experience

end
