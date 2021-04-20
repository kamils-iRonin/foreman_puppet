# frozen_string_literal: true

module ForemanPuppet
  module Mutations
    module Hosts
      module CreateExtensions
        extend ActiveSupport::Concern

        included do
          argument :puppet_proxy_id, GraphQL::Types::ID, loads: ::Types::SmartProxy
          argument :puppet_ca_proxy_id, GraphQL::Types::ID, loads: ::Types::SmartProxy
          argument :environment_id, GraphQL::Types::ID, loads: ForemanPuppet::Types::Environment
          argument :puppetclass_ids, [GraphQL::Types::ID], loads: ForemanPuppet::Types::Puppetclass, as: :puppetclasses
        end
      end
    end
  end
end
