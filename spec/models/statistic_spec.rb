require 'rails_helper'

RSpec.describe Statistic, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:agent_id) }
    it { is_expected.to validate_presence_of(:incoming_mail_errands) }
    it { is_expected.to validate_presence_of(:answered_mail_errands) }
    it { is_expected.to validate_presence_of(:total_closed_errands) }
    it { is_expected.to validate_presence_of(:handling_time) }
    it { is_expected.to validate_presence_of(:lying_untouch_mails) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  it "has a valid factory" do
    expect(create(:statistic)).to be_valid
  end
end
