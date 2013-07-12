# -*- encoding : utf-8 -*-
class AcquiredSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
end

# == Schema Information
#
# Table name: acquired_skills
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  skill_id   :integer          not null
#  experience :integer
#  level      :integer
#
# Indexes
#
#  index_acquired_skills_on_skill_id  (skill_id)
#  index_acquired_skills_on_user_id   (user_id)
#

