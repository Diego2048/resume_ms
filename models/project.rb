class Project < ActiveRecord::Base
  transform_date :begin_on, :end_on
  belongs_to :user
  validates :name, presence: true
  scope :recent, -> {order('begin_on desc, id desc')}
end
