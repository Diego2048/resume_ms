# -*- encoding : utf-8 -*-
class Education < ActiveRecord::Base
  belongs_to :user
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

