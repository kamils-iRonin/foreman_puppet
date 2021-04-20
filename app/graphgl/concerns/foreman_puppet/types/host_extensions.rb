# frozen_string_literal: true

module ForemanPuppet
  module Types
    module HostExtensions
      extend ActiveSupport::Concern

      included do
        belongs_to :puppet_ca_proxy, ::Types::SmartProxy
        belongs_to :puppet_proxy, ::Types::SmartProxy
        belongs_to :environment, ForemanPuppet::Types::Environment
      end
    end
  end
end
