class User < ActiveRecord::Base
  has_many :experiences
  has_many :projects
  has_many :educations
  has_many :acquired_skills
  has_many :skills, through: :acquired_skills
end
