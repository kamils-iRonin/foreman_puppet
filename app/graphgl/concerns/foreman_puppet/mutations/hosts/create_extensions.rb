# frozen_string_literal: true

module ForemanPuppet
  module Mutations
    module Hosts
      module CreateExtensions
        PUPPET_PARAMS = %i[
          puppet_proxy
          puppet_ca_proxy
          environment
          puppetclasses
        ].freeze

        extend ActiveSupport::Concern

        included do
          argument :puppet_proxy_id, GraphQL::Types::ID, loads: ::Types::SmartProxy
          argument :puppet_ca_proxy_id, GraphQL::Types::ID, loads: ::Types::SmartProxy
          argument :environment_id, GraphQL::Types::ID, loads: ForemanPuppet::Types::Environment
          argument :puppetclass_ids, [GraphQL::Types::ID], loads: ForemanPuppet::Types::Puppetclass, as: :puppetclasses

          private

          def initialize_object(params)
            host = super
            host.build_puppet(params.slice(*PUPPET_PARAMS))
            host
          end
        end
      end
    end
  end
end
