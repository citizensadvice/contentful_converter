# frozen_string_literal: true
require_relative './table_cell_base'

module ContentfulConverter
  module Nodes
    module Tables
      class TableHeader < TableCellBase
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
