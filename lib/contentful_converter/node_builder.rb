# frozen_string_literal: true

require 'contentful_converter/nodes/document'
require 'contentful_converter/nodes/header'
require 'contentful_converter/nodes/paragraph'
require 'contentful_converter/nodes/blockquote'
require 'contentful_converter/nodes/text'
require 'contentful_converter/nodes/underline'
require 'contentful_converter/nodes/italic'
require 'contentful_converter/nodes/strong'
require 'contentful_converter/nodes/code'
require 'contentful_converter/nodes/embed'
require 'contentful_converter/nodes/ordered_list'
require 'contentful_converter/nodes/unordered_list'
require 'contentful_converter/nodes/horizontal_line'
require 'contentful_converter/nodes/list_item'
require 'contentful_converter/nodes/hyperlink'
require 'contentful_converter/nodes/tables/table'
require 'contentful_converter/nodes/tables/table_header'
require 'contentful_converter/nodes/tables/table_row'
require 'contentful_converter/nodes/tables/table_data'


module ContentfulConverter
  class NodeBuilder
    DEFAULT_MAPPINGS = {
      '#document-fragment' => Nodes::Document,
      'h1' => Nodes::Header,
      'h2' => Nodes::Header,
      'h3' => Nodes::Header,
      'h4' => Nodes::Header,
      'h5' => Nodes::Header,
      'h6' => Nodes::Header,
      'text' => Nodes::Text,
      'span' => Nodes::Text,
      'i' => Nodes::Italic,
      'em' => Nodes::Italic,
      'u' => Nodes::Underline,
      'b' => Nodes::Strong,
      'code' => Nodes::Code,
      'strong' => Nodes::Strong,
      'p' => Nodes::Paragraph,
      'div' => Nodes::Paragraph,
      'br' => Nodes::Paragraph,
      'section' => Nodes::Paragraph,
      'embed' => Nodes::Embed,
      'img' => Nodes::Embed,
      'hr' => Nodes::HorizontalLine,
      'blockquote' => Nodes::Blockquote,
      'ul' => Nodes::UnorderedList,
      'ol' => Nodes::OrderedList,
      'li' => Nodes::ListItem,
      'a' => Nodes::Hyperlink,
      'table' => Nodes::Tables::Table,
      'tr' => Nodes::Tables::TableRow,
      'th' => Nodes::Tables::TableHeader,
      'td' => Nodes::Tables::TableData
    }.freeze

    def self.build(nokogiri_node, parent = nil)
      rich_text_node = DEFAULT_MAPPINGS[nokogiri_node.name]

      unless rich_text_node
        raise "'#{nokogiri_node.name}' Node type, does not exist"
      end

      rich_text_node.new(nokogiri_node, parent)
    end
  end
end
