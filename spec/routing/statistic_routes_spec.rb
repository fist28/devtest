require 'rails_helper'

RSpec.describe 'Routes for Statistics', :type => :routing  do
  it 'routes /api/statistics to the statistics controller and update action' do
    expect(post('/api/statistics')).
      to route_to("statistics#update")
  end
end
