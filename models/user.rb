# -*- encoding : utf-8 -*-
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

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  gender          :boolean
#  birth_on        :date
#  work_on         :date
#  degree          :integer
#  email           :string(255)
#  phone           :string(255)
#  qq              :string(255)
#  msn             :string(255)
#  city            :string(255)
#  address         :string(255)
#  hukou           :string(255)
#  family_tel      :string(255)
#  company         :string(255)
#  title           :string(255)
#  industry        :string(255)
#  website         :string(255)
#  self_intro      :text
#  contact_records :text
#  score           :integer
#  source          :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

