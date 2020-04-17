# frozen_string_literal: true

require 'spec_helper'
require 'contentful_converter'

describe ContentfulConverter do
  let(:converter) { ContentfulConverter::Converter }
  let(:html) { '<html><body><h1>hello world</h1><p>hi</p></body></html>' }
  let(:modifier) { { force_header_size: "3" } }

  before do
    allow(converter).to receive(:convert).with(html)
  end

  describe '.convert' do
    it 'sends convert message with html param to converter class' do
      expect(ContentfulConverter::Converter)
        .to receive(:convert)
        .with(html)
        .and_return(Hash)

      described_class.convert(html)
    end

    it 'sets the modifiers as a class variable' do
      described_class.convert(html, modifier)
      expect(described_class.modifiers).to eq(modifier)
    end
  end
end
