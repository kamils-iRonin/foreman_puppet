require 'test_puppet_helper'

module Queries
  class HostPuppetQueryTest < GraphQLQueryTestCase
    let(:query) do
      <<-GRAPHQL
      query (
        $id: String!
      ) {
        host(id: $id) {
          id
          environment {
            id
          }
          puppetCaProxy {
            id
          }
          puppetProxy {
            id
          }
        }
      }
      GRAPHQL
    end

    let(:host) { FactoryBot.create(:host, :with_puppet_enc) }
    let(:global_id) { Foreman::GlobalId.encode('Host', host.id) }
    let(:variables) { { id: global_id } }
    let(:data) { result['data']['host'] }

    test 'fetching host attributes' do
      assert_empty result['errors']
      assert_equal global_id, data['id']
      assert_record host.environment, data['environment']
      assert_record host.puppet_proxy, data['puppetProxy']
      assert_record host.puppet_ca_proxy, data['puppetCaProxy']
    end
  end
end
