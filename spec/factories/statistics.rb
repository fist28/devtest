FactoryBot.define do
  factory :statistic do
    sequence(:agent_id) { |n| n }
    user
  end
end
