# -*- encoding : utf-8 -*-
class Experience < ActiveRecord::Base
  belongs_to :user
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
#  start_on   :date
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

