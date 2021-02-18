class Profile < ApplicationRecord
  include Profiled::Model::Profile
  include Agential::Model::Client

  store_accessor :extra, :wechat, :major, :degree, :highest_education, :work_experience

end
