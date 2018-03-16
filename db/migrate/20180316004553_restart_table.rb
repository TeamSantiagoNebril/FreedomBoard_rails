class RestartTable < ActiveRecord::Migration
  def change
    drop_table :freedom_messages
    create_table :freedom_messages do |t|
      t.string :name
      t.text :message
      t.timestamps null: false
    end
  end
end
