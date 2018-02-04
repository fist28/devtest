require 'rails_helper'

RSpec.describe Statistic, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:agent_id) }
    it { should validate_presence_of(:incoming_mail_errands) }
    it { should validate_presence_of(:answered_mail_errands) }
    it { should validate_presence_of(:total_closed_errands) }
    it { should validate_presence_of(:handling_time) }
    it { should validate_presence_of(:lying_untouch_mails) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end

  it "has a valid factory" do
    create(:statistic).should be_valid
  end
end
