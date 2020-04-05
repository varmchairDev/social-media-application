class CreateBlockingUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :blocking_users do |t|
      t.integer :blocker_id
      t.integer :blocked_id

      t.timestamps
    end
    add_index :blocking_users, [:blocker_id, :blocked_id], unique: true
  end
end
