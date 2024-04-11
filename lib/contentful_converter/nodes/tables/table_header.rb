# frozen_string_literal: true

require 'contentful_converter/nodes/base'

module ContentfulConverter
  module Nodes
    module Tables
      class TableHeader < Base
        def needs_p_wrapping?
          false
        end

        private

        def type
          'table-header-cell'
        end
      end
    end
  end
end
