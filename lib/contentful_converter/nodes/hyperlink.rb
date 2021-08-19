# frozen_string_literal: true

require 'contentful_converter/nodes/base'
require 'uri'

module ContentfulConverter
  module Nodes
    class Hyperlink < Base
      SECTIONS = %w[family immigration debt-and-money law-and-courts consumer benefits health housing work about-us]
      private

      def type
        return 'hyperlink' if parsed_link.to_s.empty?
        return 'hyperlink' if internal_link?
        return 'asset-hyperlink' if !uri_scheme? && uri_extension?
        return 'entry-hyperlink' if !uri_scheme? && !parsed_link.to_s.include?("#")

        'hyperlink'
      end

      def options
        return hyperlink_option if parsed_link.to_s.empty?
        return hyperlink_option if internal_link?
        return hyperlink_entry_option('Asset') if !uri_scheme? && uri_extension?
        return hyperlink_entry_option('Entry') if !uri_scheme? && !parsed_link.to_s.include?("#")

        hyperlink_option
      end

      def hyperlink_option
        { data: { uri: parsed_link.to_s } }
      end

      def hyperlink_entry_option(type)
        {
          data: {
            target: {
              sys: {
                id: parsed_link.to_s,
                type: 'Link',
                linkType: type
              }
            }
          }
        }
      end

      def hyperlink_option
        link = parsed_link.host == 'www.citizensadvice.org.uk' ? link_path : parsed_link

        { data: { uri: link.to_s } }
      end

      def link_path
        parsed_link.path
      end

      def uri_scheme?
        parsed_link.scheme
      end

      def uri_extension?
        parsed_link.to_s.split('.')[1]
      end

      def parsed_link
        link_value ? URI(link_value) : URI('')
      end

      def link_value
        nokogiri_node[:href]
      end

      def internal_link?
        return if parsed_link.path.nil?

        section = parsed_link.to_s.delete_prefix("https://www.citizensadvice.org.uk/")
        section = section.delete_prefix("/")
        section = section.delete_prefix("advisernet/")
        section = section.split("/").compact.first

        SECTIONS.include?(section) || section == "scotland" || section == "wales"
      end
    end
  end
end
