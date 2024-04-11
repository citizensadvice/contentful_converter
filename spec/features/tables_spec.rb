# frozen_string_literal: true

require 'spec_helper'
require 'contentful_converter/converter'

describe ContentfulConverter::Converter do
  describe 'Convert' do
    # context 'when there is a table element' do
    #   let(:html) { '<table class=\"datatable\">\n<thead>\n<tr>\n<th><strong>Which rights</strong></th>\n<th><strong>New Scottish secure tenant (SST)</strong></th>\n<th><strong>Was secure tenant now SST</strong></th>\n<th><strong>Was assured tenant now SST</strong></th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><strong>Rent</strong></td>\n<td>\n<p>a) Fixed by landlord with 4 weeks notice to tenant.</p>\n<p>b) Landlord must consult with those affected and take account of view expressed.</p>\n</td>\n<td>Pre 1989 secure tenants of housing associations have a right to have their rent assessed by the rent officer every 3 years.</td>\n<td>Statutory assured tenants have the right to apply to the First-tier Tribunal for Scotland (Housing and Property Chamber).</td>\n</tr>\n<tr>\n<td><strong><a title=\"Warning end of right to buy\" href=\"#h-warning-end-of-right-to-buy-para35\">Right to buy</a> ended on 1 August 2016</strong></td>\n<td>\n<p>Changes to the original scheme to:</p>\n<p>a) discount</p>\n<p>b) the eligibility period</p>\n<p>c) rent to loan scheme.</p>\n</td>\n<td>Tenant kept their right to buy under conditions from the original scheme until they moved to another property.</td>\n<td>Tenant kept their right to buy under conditions from the original scheme until they moved to another property.</td>\n</tr>\n</tbody>\n</table>'}
    #   let(:expected_hash) {
    #     {
    #       :nodeType=>"document",
    #       :data=>{},
    #       :content=>
    #         [{:nodeType=>"table",
    #           :data=>{},
    #           :content=>
    #           [{:nodeType=>"table-row",
    #             :data=>{},
    #             :content=>
    #               [{:nodeType=>"table-header-cell", :data=>{}, :content=>[{:nodeType=>"paragraph", :data=>{}, :content=>[{:nodeType=>"text", :value=>"Which rights", :marks=>[], :data=>{}}]}]},
    #               {:nodeType=>"table-header-cell",
    #                 :data=>{},
    #                 :content=>[{:nodeType=>"paragraph", :data=>{}, :content=>[{:nodeType=>"text", :value=>"New Scottish secure tenant (SST)", :marks=>[], :data=>{}}]}]},
    #               {:nodeType=>"table-header-cell",
    #                 :data=>{},
    #                 :content=>[{:nodeType=>"paragraph", :data=>{}, :content=>[{:nodeType=>"text", :value=>"Was secure tenant now SST", :marks=>[], :data=>{}}]}]},
    #               {:nodeType=>"table-header-cell",
    #                 :data=>{},
    #                 :content=>[{:nodeType=>"paragraph", :data=>{}, :content=>[{:nodeType=>"text", :value=>"Was assured tenant now SST", :marks=>[], :data=>{}}]}]}]},
    #             {:nodeType=>"table-row",
    #             :data=>{},
    #             :content=>
    #               [{:nodeType=>"table-cell", :data=>{}, :content=>[{:nodeType=>"paragraph", :data=>{}, :content=>[{:nodeType=>"text", :value=>"Rent", :marks=>[], :data=>{}}]}]},
    #               {:nodeType=>"table-cell",
    #                 :data=>{},
    #                 :content=>
    #                 [{:nodeType=>"paragraph", :data=>{}, :content=>[{:nodeType=>"text", :value=>"a) Fixed by landlord with 4 weeks notice to tenant.", :marks=>[], :data=>{}}]},
    #                   {:nodeType=>"paragraph",
    #                   :data=>{},
    #                   :content=>[{:nodeType=>"text", :value=>"b) Landlord must consult with those affected and take account of view expressed.", :marks=>[], :data=>{}}]}]},
    #               {:nodeType=>"table-cell",
    #                 :data=>{},
    #                 :content=>
    #                 [{:nodeType=>"paragraph",
    #                   :data=>{},
    #                   :content=>
    #                     [{:nodeType=>"text",
    #                       :value=>"Pre 1989 secure tenants of housing associations have a right to have their rent assessed by the rent officer every 3 years.",
    #                       :marks=>[],
    #                       :data=>{}}]}]},
    #               {:nodeType=>"table-cell",
    #                 :data=>{},
    #                 :content=>
    #                 [{:nodeType=>"paragraph",
    #                   :data=>{},
    #                   :content=>
    #                     [{:nodeType=>"text",
    #                       :value=>"Statutory assured tenants have the right to apply to the First-tier Tribunal for Scotland (Housing and Property Chamber).",
    #                       :marks=>[],
    #                       :data=>{}}]}]}]},
    #             {:nodeType=>"table-row",
    #             :data=>{},
    #             :content=>
    #               [{:nodeType=>"table-cell",
    #                 :data=>{},
    #                 :content=>
    #                 [{:nodeType=>"paragraph",
    #                   :data=>{},
    #                   :content=>
    #                     [{:nodeType=>"text", :value=>"", :marks=>[], :data=>{}},
    #                     {:nodeType=>"hyperlink",
    #                       :data=>{:uri=>"#h-warning-end-of-right-to-buy-para35"},
    #                       :content=>[{:nodeType=>"text", :value=>"Right to buy ended on 1 August 2016", :marks=>[], :data=>{}}]},
    #                     {:nodeType=>"text", :value=>"", :marks=>[], :data=>{}}]}]},
    #               {:nodeType=>"table-cell",
    #                 :data=>{},
    #                 :content=>
    #                 [{:nodeType=>"paragraph", :data=>{}, :content=>[{:nodeType=>"text", :value=>"Changes to the original scheme to:", :marks=>[], :data=>{}}]},
    #                   {:nodeType=>"paragraph", :data=>{}, :content=>[{:nodeType=>"text", :value=>"a) discount", :marks=>[], :data=>{}}]},
    #                   {:nodeType=>"paragraph", :data=>{}, :content=>[{:nodeType=>"text", :value=>"b) the eligibility period", :marks=>[], :data=>{}}]},
    #                   {:nodeType=>"paragraph", :data=>{}, :content=>[{:nodeType=>"text", :value=>"c) rent to loan scheme.", :marks=>[], :data=>{}}]}]},
    #               {:nodeType=>"table-cell",
    #                 :data=>{},
    #                 :content=>
    #                 [{:nodeType=>"paragraph",
    #                   :data=>{},
    #                   :content=>
    #                     [{:nodeType=>"text", :value=>"Tenant kept their right to buy under conditions from the original scheme until they moved to another property.", :marks=>[], :data=>{}}]}]},
    #               {:nodeType=>"table-cell",
    #                 :data=>{},
    #                 :content=>
    #                 [{:nodeType=>"paragraph",
    #                   :data=>{},
    #                   :content=>
    #                     [{:nodeType=>"text",
    #                       :value=>"Tenant kept their right to buy under conditions from the original scheme until they moved to another property.",
    #                       :marks=>[],
    #                       :data=>{}
    #                     }]
    #                   }]
    #               }]
    #             }]
    #           }]
    #         }
    #   }

    #   it 'converts an html table correctly' do
    #     # expect(described_class.convert(html)).to eq expected_hash
    #   end

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

        it "converts the table correctly" do
          expect(described_class.convert(html)).to eq expected_hash
        end
      end
    end
  end
end
