class Comment < ActiveRecord::Base
  attr_accessible :task_id, :body

  belongs_to :user
  belongs_to :task

  validates :user, :task, :body, presence: true
end
