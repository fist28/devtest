class Statistic < ApplicationRecord
  validates :user_id, :agent_id, :incoming_mail_errands, :answered_mail_errands, :total_closed_errands,
            :handling_time, :lying_untouch_mails,
            presence: true

  belongs_to :user
end
