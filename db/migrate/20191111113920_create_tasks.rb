class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :status, default: false
      t.datetime :scheduled, null: false, default: Time.now
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
