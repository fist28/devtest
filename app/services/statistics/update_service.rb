class Statistics::UpdateService
  attr_reader :agents, :statistics
  def initialize(agents, statistics)
    @agents = agents
    @statistics = statistics
  end

  def call
    ActiveRecord::Base.transaction do
      agents.each do |agent|
        increment_kpi(agent)
      end
    end
  end

  private

  def increment_kpi(agent)
    statistic = statistic(agent)
    statistics.each do |attribute, value|
      statistic.increment(attribute.to_sym, value.to_i)
    end
    statistic.save!
  end

  def statistic(agent)
    Statistic.find_or_initialize_by(agent_id: agent['external_id']).tap do |statistic|
      create_user(agent, statistic) if statistic.user.nil?
    end
  end

  def create_user(agent, statistic)
    statistic.create_user!(agent.slice('first_name', 'last_name', 'email'))
  end
end
