# -*- encoding : utf-8 -*-
module WillPaginate
  module Sinatra

    class MyLinkRenderer < LinkRenderer

      protected

      def page_number(page)
        html = unless page == current_page
          link(page, page)
        else
          tag(:span, page)
        end
        tag :li, html, class: page == current_page ? 'disabled' : nil
      end

      def previous_or_next_page(page, text, classname)
        classname = ''
        tag :li, super, class: page ? nil : 'disabled'
      end

      def html_container(html)
        tag(:div, "<ul>#{html}</ul>", container_attributes)
      end
    end

    module Helpers
      def will_paginate(collection, options = {}) #:nodoc:
        options = options.merge(:renderer => MyLinkRenderer) unless options[:renderer]
        super(collection, options)
      end
    end
  end
end