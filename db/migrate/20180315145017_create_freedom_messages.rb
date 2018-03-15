class CreateFreedomMessages < ActiveRecord::Migration
  def change
    create_table :freedom_messages do |t|
      t.string :name
      t.text :message
      t.timestamps null: false
    end
  end
end
