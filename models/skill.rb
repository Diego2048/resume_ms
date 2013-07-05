class Skill < ActiveRecord::Base
  has_many :acquired_skills
  has_many :users, through: :acquired_skills
end
