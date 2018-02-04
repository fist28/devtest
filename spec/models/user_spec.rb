require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should have_one(:statistic) }
  end

  it "has a valid factory" do
    create(:user).should be_valid
  end
end
