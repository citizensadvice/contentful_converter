# frozen_string_literal: true

require 'contentful_converter/nodes/base'


module ContentfulConverter
  module Nodes
    module Tables
      class TableCellBase < ::ContentfulConverter::Nodes::Base

        def to_h(params = {})
          h = super
          h[:content] = [empty_node] if params[:content].empty?
          h
        end

        private

        def empty_node
          empty_node =  {
            :nodeType => "paragraph",
            :data => {},
            :content => [{
              :nodeType => "text",
              :data => {},
              :value => "",
              :marks => []
            }]
          }
        end
      end
    end
  end
end
