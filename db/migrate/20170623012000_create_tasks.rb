class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :user_id
      t.integer :local_realm_id
      t.string :name
      t.string :note
      t.string :original_scheduled_date
      t.string :current_scheduled_date
      t.integer :migration_count
      t.boolean :complete
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
