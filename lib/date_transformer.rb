module DateTransformer
  def transform_date(*date_attrs)
    date_attrs = date_attrs.to_a.flatten.compact.map(&:to_sym)
    date_attrs.map(&:to_s).each do |date_attr|
      attr_writer "#{date_attr}_year", "#{date_attr}_month"
      validate "validate_#{date_attr}"
      before_save "set_#{date_attr}"
      class_eval %(
        def #{date_attr}_year
          @#{date_attr}_year || (#{date_attr}.year if #{date_attr})
        end

        def #{date_attr}_month
          @#{date_attr}_month || (#{date_attr}.month if #{date_attr})
        end

        def validate_#{date_attr}
          if @#{date_attr}_year.present?
            errors.add(:#{date_attr}, "年份必须在1950～2030之间") unless (1950..2030).include?(@#{date_attr}_year.to_i)
            errors.add(:#{date_attr}, "月份格式不正确") unless (1..12).include?(@#{date_attr}_month.to_i)
          end
        end

        def set_#{date_attr}
          self.#{date_attr} = @#{date_attr}_year.present? && @#{date_attr}_month.present? ? Date.new(@#{date_attr}_year.to_i, #{date_attr}_month.to_i) : nil
        end
      )
    end
  end
end

ActiveRecord::Base.extend DateTransformer