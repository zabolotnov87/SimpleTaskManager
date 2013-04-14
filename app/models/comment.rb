class Comment < ActiveRecord::Base
  attr_accessible :user_id, :task_id, :body

  belongs_to :user
  belongs_to :task

  validates :user_id, :task_id, :body, presence: true
end
