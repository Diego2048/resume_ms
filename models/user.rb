class User < ActiveRecord::Base
  attr_writer :birth_on_year, :birth_on_month, :work_on_year, :work_on_month
  has_many :experiences
  has_many :projects
  has_many :educations
  has_many :acquired_skills
  has_many :skills, through: :acquired_skills

  validates :name, :gender, presence: true
  validate :validate_birth_on, :validate_work_on

  def validate_birth_on
    if @birth_on_year.present?
      errors.add(:birth_on, "年份必须在1950～2030之间") unless (1950..2030).include?(@birth_on_year.to_i)
      errors.add(:birth_on, "月份格式不正确") unless (1..12).include?(@birth_on_month.to_i)
    end
  end

  def validate_work_on
    if @work_on_year.present?
      errors.add(:work_on, "年份必须在1950～2030之间") unless (1950..2030).include?(@work_on_year.to_i)
      errors.add(:work_on, "月份格式不正确") unless (1..12).include?(@work_on_month.to_i)
    end
  end

  %w(birth_on_year birth_on_month work_on_year work_on_month).each do |m|
    mm = m.split('_')
    attr_method = "#{mm[0]}_#{mm[1]}"
    define_method m.to_sym do
      self.instance_variable_get("@#{m}") || (self.send(attr_method).send(mm[2]) if self.send(attr_method))
    end
  end

  before_save :set_date_on
  def set_date_on
    self.birth_on = @birth_on_year.present? && @birth_on_month.present? ? Date.new(@birth_on_year.to_i, @birth_on_month.to_i) : nil 
    self.work_on = @work_on_year.present? && @work_on_month.present? ? Date.new(@work_on_year.to_i, @work_on_month.to_i) : nil
  end

  def gender_name
    gender? ? 1 : 0 unless gender.nil?
  end

end
