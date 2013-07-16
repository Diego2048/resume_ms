# -*- encoding : utf-8 -*-
class Skill < ActiveRecord::Base
  has_many :acquired_skills
  has_many :users, through: :acquired_skills

  validates :name, presence: true
end

# == Schema Information
#
# Table name: skills
#
#  id   :integer          not null, primary key
#  name :string(255)
#

