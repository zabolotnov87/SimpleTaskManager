class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  validates :user_id, :story_id, :text, presence: true
end
