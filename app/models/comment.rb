class Comment < ActiveRecord::Base
  attr_accessible :body

  belongs_to :user
  belongs_to :task

  validates :user, :task, :body, presence: true
end
