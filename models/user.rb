class User < ActiveRecord::Base
  transform_date :birth_on, :work_on
  has_many :experiences
  has_many :projects
  has_many :educations
  has_many :acquired_skills
  has_many :skills, through: :acquired_skills

  validates :name, :gender, presence: true

  def gender_name
    gender? ? 1 : 0 unless gender.nil?
  end

end
