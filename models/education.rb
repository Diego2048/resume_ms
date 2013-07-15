# -*- encoding : utf-8 -*-
class Education < ActiveRecord::Base
  transform_date :begin_on, :end_on
  belongs_to :user
  validates :school, presence: true
  scope :recent, -> {order('begin_on desc, id desc')}
end

# == Schema Information
#
# Table name: educations
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  school     :string(255)
#  begin_on   :date
#  end_on     :date
#  degree     :string(255)
#  major      :string(255)
#  summary    :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_educations_on_user_id  (user_id)
#

