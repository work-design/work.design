class Profile < ApplicationRecord
  include Profile::Model::Profile
  include Agential::Model::Client

  store_accessor :extra, :wechat, :major, :degree, :highest_education, :work_experience

end
