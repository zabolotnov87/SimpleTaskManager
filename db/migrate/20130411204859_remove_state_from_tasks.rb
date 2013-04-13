class RemoveStateFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :state
  end

  def down
    add_column :tasks, :state, :integer
  end
end
