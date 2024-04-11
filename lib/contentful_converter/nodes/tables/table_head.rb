# frozen_string_literal: true

require 'contentful_converter/nodes/base'

module ContentfulConverter
  module Nodes
    module Tables
      class TableHead < Base
        def needs_p_wrapping?
          false
        end

        def to_h(params = {})
          nil
        end

        private

        def type
          'table-head'
        end
      end
    end
  end
end
