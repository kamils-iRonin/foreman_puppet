# frozen_string_literal: true

module ForemanPuppet
  module Types
    module HostgroupExtensions
      extend ActiveSupport::Concern

      included do
        belongs_to :puppet_ca_proxy, ::Types::SmartProxy
        belongs_to :puppet_proxy, ::Types::SmartProxy
        belongs_to :environment, ForemanPuppet::Types::Environment
        has_many :puppetclasses, ForemanPuppet::Types::Puppetclass
      end
    end
  end
end
