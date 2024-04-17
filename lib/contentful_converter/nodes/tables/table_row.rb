# frozen_string_literal: true

module ContentfulConverter
  module Nodes
    module Tables
      class TableRow < Base
        def needs_p_wrapping?
          false
        end

        private

        def type
          'table-row'
        end
      end
    end
  end
end
