# frozen_string_literal: true

require 'contentful_converter/nodes/base'

module ContentfulConverter
  module Nodes
    module Tables
      class Table < Base
        def needs_p_wrapping?
          false
        end

        private

        def type
          'table'
        end
      end
    end
  end
end
