# -*- encoding : utf-8 -*-
class Experience < ActiveRecord::Base
  transform_date :begin_on, :end_on
  belongs_to :user
  validates :company, presence: true
  scope :recent, -> {order('begin_on desc, id desc')}
end

# == Schema Information
#
# Table name: experiences
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  company    :string(255)
#  industry   :string(255)
#  department :string(255)
#  begin_on   :date
#  end_on     :date
#  title      :string(255)
#  summary    :text
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_experiences_on_user_id  (user_id)
#

