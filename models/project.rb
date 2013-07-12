# -*- encoding : utf-8 -*-
class Project < ActiveRecord::Base
  transform_date :begin_on, :end_on
  belongs_to :user
  validates :name, presence: true
  scope :recent, -> {order('begin_on desc, id desc')}
end

# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string(255)
#  begin_on   :date
#  end_on     :date
#  summary    :text
#  duty       :text
#  platform   :text
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#

