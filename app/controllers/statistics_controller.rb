class StatisticsController < ApplicationController
  def update
    statistic  = Statistics::UpdateService.new(agents_params, statistics_params).call
    render head: :no_content
  end

  def agents_params
    params.require(:agents).map do |p|
      p.permit(:external_id, :first_name, :last_name, :email)
    end
  end

  def statistics_params
    params.require(:Statistics).permit(:incoming_mail_errands, :answered_mail_errands,
      :total_closed_errands, :handling_time, :lying_untouch_mails)
  end
end
