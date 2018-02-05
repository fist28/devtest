require 'rails_helper'

RSpec.describe Statistics::UpdateService do
  let(:params) { fixture('statistics') }
  let(:agent) { params['agents'].first }
  let(:statistics) { params['Statistics'] }

  describe '#create_user(agent, statistic)' do
    let(:service) { described_class.new({}, {}) }
    let(:statistic) { Statistic.new(attributes_for(:statistic)) }

    it 'create user' do
      expect{service.send(:create_user, agent, statistic)}.
        to change{User.count}.from(0).to(1)
    end

    it 'statistic has fill user_id' do
      expect(statistic.user_id).to eq nil
      user = service.send(:create_user, agent, statistic)
      expect(statistic.user_id).to eq user.id
    end
  end

  describe '#increment_kpi(agent)' do
    let(:service) { described_class.new({}, statistics) }

    describe 'with existing agent' do
      let!(:user) { User.create!(agent.slice('first_name', 'last_name', 'email')) }
      let!(:user_kpi) do
        user.create_statistic!(
          agent_id: agent['external_id'],
          incoming_mail_errands: 10,
          answered_mail_errands: 10,
          total_closed_errands: 10,
          handling_time: 10,
          lying_untouch_mails: 10 )
      end

      it 'increase kpi for agent' do
        statistics.each do |key, _value|
          expect(user_kpi[key]).to eq 10
        end
        service.send(:increment_kpi, agent)
        user_kpi.reload

        statistics.each do |key, value|
          expect(user_kpi[key]).to eq value.to_i + 10
        end
      end
    end
  end
end
