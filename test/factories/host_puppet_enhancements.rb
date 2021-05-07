FactoryBot.modify do
  factory :host do
    trait :with_puppet_enc do
      puppet { association :host_puppet_facet, :with_config_group, :with_puppet_proxy, :with_puppet_ca_proxy, :with_puppetclass }
    end
  end

  factory :hostgroup do
    trait :with_puppet_enc do
      puppet { association :hostgroup_puppet_facet, :with_config_group, :with_puppet_proxy, :with_puppet_ca_proxy, :with_puppetclass }
    end
  end

  factory :template_combination do
    environment
  end
end
