class User < ActiveRecord::Base
  has_many :experiences
  has_many :projects
  has_many :educations
end
