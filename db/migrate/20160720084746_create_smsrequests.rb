class CreateSmsrequests < ActiveRecord::Migration
  def change
    create_table :smsrequests do |t|
      t.string :mobile
      t.string :message

      t.timestamps null: false
    end
  end
end
