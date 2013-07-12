# -*- encoding : utf-8 -*-
module CustomFormBuilder
  def locale_select(field, name, options={})
    abbr_name = name.sub('.', '.abbr_')
    options.merge!(:options => I18n.t(name).zip(I18n.t(abbr_name)), :class => 'input-small')
    select(field, options)
  end

  def month_select(field, options={})
    locale_select(field, 'date.month_names', options)
  end
end

module Padrino
  module Helpers
    module FormBuilder # @private
      class AbstractFormBuilder # @private
        include CustomFormBuilder
      end
    end
  end
end
