class CreateStatistics < ActiveRecord::Migration[5.1]
  def change
    create_table :statistics do |t|
      t.integer :user_id, null: false, index: true
      t.integer :agent_id, null: false, index: true
      t.integer :incoming_mail_errands, default: 0, null: false
      t.integer :answered_mail_errands, default: 0, null: false
      t.integer :total_closed_errands, default: 0, null: false
      t.integer :handling_time, default: 0, null: false
      t.integer :lying_untouch_mails, default: 0, null: false

      t.timestamps
    end
  end
end
