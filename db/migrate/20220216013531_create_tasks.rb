class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :deadline
      t.integer :priority
      t.string :penalty
      t.integer :reward
      t.string :status
      t.text :detail
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
