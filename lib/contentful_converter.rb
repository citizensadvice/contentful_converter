# frozen_string_literal: true

require 'contentful_converter/converter'

module ContentfulConverter
  def self.convert(html, modifiers = {})
    @@modifiers = modifiers
    Converter.convert(html)
  end

  def self.modifiers
    @@modifiers
  end
end
