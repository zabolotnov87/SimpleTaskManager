class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :task_id

      t.timestamps
      add_index :comments, :user_id
      add_index :comments, :task_id
    end
  end
end
