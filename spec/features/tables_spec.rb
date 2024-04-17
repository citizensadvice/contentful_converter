# frozen_string_literal: true

require 'spec_helper'
require 'contentful_converter/converter'

describe ContentfulConverter::Converter do
  describe 'Convert' do
    context 'when there is a table element' do
      let(:html) do
        '<table class=\"datatable\">\n<thead>\n<tr>\n<th><strong>Which rights</strong></th>\n<th><strong>New Scottish secure tenant (SST)</strong></th>\n<th><strong>Was secure tenant now SST</strong></th>\n<th><strong>Was assured tenant now SST</strong></th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><strong>Rent</strong></td>\n<td>\n<p>a) Fixed by landlord with 4 weeks notice to tenant.</p>\n<p>b) Landlord must consult with those affected and take account of view expressed.</p>\n</td>\n<td>Pre 1989 secure tenants of housing associations have a right to have their rent assessed by the rent officer every 3 years.</td>\n<td>Statutory assured tenants have the right to apply to the First-tier Tribunal for Scotland (Housing and Property Chamber).</td>\n</tr>\n<tr>\n<td><strong>Right to buy ended on 1 August 2016</strong></td>\n<td>\n<p>Changes to the original scheme to:</p>\n<p>a) discount</p>\n<p>b) the eligibility period</p>\n<p>c) rent to loan scheme.</p>\n</td>\n<td>Tenant kept their right to buy under conditions from the original scheme until they moved to another property.</td>\n<td>Tenant kept their right to buy under conditions from the original scheme until they moved to another property.</td>\n</tr>\n</tbody>\n</table>'
      end
      let(:expected_hash) do
        {
          nodeType: 'document',
          data: {},
          content: [{
            content: [
              { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {},
                nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [{ type: 'bold' }], nodeType: 'text', value: 'Which rights' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-header-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [{ type: 'bold' }], nodeType: 'text', value: 'New Scottish secure tenant (SST)' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-header-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [{ type: 'bold' }], nodeType: 'text', value: 'Was secure tenant now SST' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-header-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [{ type: 'bold' }], nodeType: 'text', value: 'Was assured tenant now SST' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-header-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-row' }, { content: [{ content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [{ type: 'bold' }], nodeType: 'text', value: 'Rent' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: 'a) Fixed by landlord with 4 weeks notice to tenant.' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: 'b) Landlord must consult with those affected and take account of view expressed.' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [], nodeType: 'text', value: 'Pre 1989 secure tenants of housing associations have a right to have their rent assessed by the rent officer every 3 years.' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [], nodeType: 'text', value: 'Statutory assured tenants have the right to apply to the First-tier Tribunal for Scotland (Housing and Property Chamber).' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-row' }, { content: [{ content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [{ type: 'bold' }], nodeType: 'text', value: 'Right to buy ended on 1 August 2016' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: 'Changes to the original scheme to:' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: 'a) discount' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: 'b) the eligibility period' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: 'c) rent to loan scheme.' }], data: {}, nodeType: 'paragraph' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [], nodeType: 'text', value: 'Tenant kept their right to buy under conditions from the original scheme until they moved to another property.' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }, { content: [{ content: [{ data: {}, marks: [], nodeType: 'text', value: 'Tenant kept their right to buy under conditions from the original scheme until they moved to another property.' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-cell' }, { content: [{ data: {}, marks: [], nodeType: 'text', value: '\\n' }], data: {}, nodeType: 'paragraph' }], data: {}, nodeType: 'table-row' }
            ], data: {}, nodeType: 'table'
          }]

        }
      end

      it 'converts an html table correctly' do
        expect(described_class.convert(html)).to eq expected_hash
      end
    end

    context 'when there is a table head element' do
      let(:html) { '<table><thead><tr><th><p>Content in a table header</th></tr></thead></table>' }
      let(:expected_hash) do
        {
          nodeType: 'document',
          data: {},
          content: [{ nodeType: 'table',
                      data: {},
                      content: [{ nodeType: 'table-row',
                                  data: {},
                                  content: [{ nodeType: 'table-header-cell',
                                              data: {},
                                              content: [{ nodeType: 'paragraph',
                                                          data: {},
                                                          content: [{ value: 'Content in a table header',
                                                                      marks: [],
                                                                      nodeType: 'text',
                                                                      data: {} }] }] }] }] }]
        }
      end

      it 'converts the table correctly' do
        expect(described_class.convert(html)).to eq expected_hash
      end

      context 'when there is no table head element' do
        let(:html) { '<table><tr><th><p>Content in a table header</th></tr></table>' }

        it 'converts the table correctly' do
          expect(described_class.convert(html)).to eq expected_hash
        end
      end
    end

    context 'when there is a table body element' do
      let(:html) { '<table><tbody><tr><td><p>Content in a table data cell.</p></td></tr></tbody></table>' }
      let(:expected_hash) do
        {
          nodeType: 'document',
          data: {},
          content: [{
            content: [{
              content: [{
                content: [{ content: [{ data: {}, marks: [], nodeType: 'text', value: 'Content in a table data cell.' }], data: {},
                            nodeType: 'paragraph' }], data: {}, nodeType: 'table-cell'
              }], data: {}, nodeType: 'table-row'
            }], data: {}, nodeType: 'table'
          }]
        }
      end

      it 'converts the table correctly' do
        expect(described_class.convert(html)).to eq expected_hash
      end

      context 'when there is no table body element' do
        let(:html) { '<table><tr><td><p>Content in a table data cell.</p></td></tr></table>' }

        it 'converts the table correctly' do
          expect(described_class.convert(html)).to eq expected_hash
        end
      end
    end

    context 'when there is a link in a table cell' do
      let(:html) { '<table><tbody><tr><td><p>Content in a table data cell <a href="https://www.google.com">A link</a>.</p><p>A <a href="#fragment-link">fragment link</a></p></td></tr></tbody></table>' }
      let(:expected_hash) do
        { nodeType: 'document',
          data: {},
          content: [{ nodeType: 'table',
                      data: {},
                      content: [{ nodeType: 'table-row',
                                  data: {},
                                  content: [{ nodeType: 'table-cell',
                                              data: {},
                                              content: [{ nodeType: 'paragraph',
                                                          data: {},
                                                          content: [{ value: 'Content in a table data cell ',
                                                                      marks: [],
                                                                      nodeType: 'text',
                                                                      data: {} },
                                                                    { data: { uri: 'https://www.google.com' },
                                                                      nodeType: 'hyperlink',
                                                                      content: [{ value: 'A link',
                                                                                  marks: [],
                                                                                  nodeType: 'text',
                                                                                  data: {} }] },
                                                                    { value: '.', marks: [], nodeType: 'text',
                                                                      data: {} }] },
                                                        { nodeType: 'paragraph',
                                                          data: {},
                                                          content: [{ value: 'A ', marks: [], nodeType: 'text', data: {} },
                                                                    { data: { uri: '#fragment-link' },
                                                                      nodeType: 'hyperlink',
                                                                      content: [{ value: 'fragment link',
                                                                                  marks: [],
                                                                                  nodeType: 'text',
                                                                                  data: {} }] }] }] }] }] }] }
      end

      it 'converts the table correctly' do
        expect(described_class.convert(html)).to eq expected_hash
      end
    end

    context 'when there are two tables' do
      let(:html) do
        '<table><tbody><tr><td><p>Content in a table data cell first row.</p></td></tr></tbody></table><p>Another table:</p><table><tbody><tr><td><p>Content in a table data cell second row.</p></td></tr></tbody></table>'
      end
      let(:expected_hash) do
        { nodeType: 'document',
          data: {},
          content: [{ nodeType: 'table',
                      data: {},
                      content: [{ nodeType: 'table-row',
                                  data: {},
                                  content: [{ nodeType: 'table-cell',
                                              data: {},
                                              content: [{ nodeType: 'paragraph',
                                                          data: {},
                                                          content: [{ value: 'Content in a table data cell first row.',
                                                                      marks: [],
                                                                      nodeType: 'text',
                                                                      data: {} }] }] }] }] },
                    { nodeType: 'paragraph',
                      data: {},
                      content: [{ value: 'Another table:', marks: [], nodeType: 'text', data: {} }] },
                    { nodeType: 'table',
                      data: {},
                      content: [{ nodeType: 'table-row',
                                  data: {},
                                  content: [{ nodeType: 'table-cell',
                                              data: {},
                                              content: [{ nodeType: 'paragraph',
                                                          data: {},
                                                          content: [{ value: 'Content in a table data cell second row.',
                                                                      marks: [],
                                                                      nodeType: 'text',
                                                                      data: {} }] }] }] }] }] }
      end

      it 'converts the table correctly' do
        expect(described_class.convert(html)).to eq expected_hash
      end
    end

    context 'when there are empty table cells' do
      let(:html) { '<table><thead><tr><th></th></tr></thead><tbody><tr><td></td></tr></tbody></table>' }
      let(:expected_hash) do
        { nodeType: 'document', data: {},
          content: [{ nodeType: 'table', data: {}, content: [{ nodeType: 'table-row', data: {}, content: [{ nodeType: 'table-header-cell', data: {}, content: [{ nodeType: 'paragraph', data: {}, content: [{ nodeType: 'text', data: {}, value: '', marks: [] }] }] }] }, { nodeType: 'table-row', data: {}, content: [{ nodeType: 'table-cell', data: {}, content: [{ nodeType: 'paragraph', data: {}, content: [{ nodeType: 'text', data: {}, value: '', marks: [] }] }] }] }] }] }
      end

      it 'adds an non-breaking space' do
        expect(described_class.convert(html)).to eq expected_hash
      end
    end
  end
end
