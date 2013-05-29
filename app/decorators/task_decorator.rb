class TaskDecorator < Draper::Decorator
  delegate_all

  def owner_name
    has_owner? ? user.email : '<none>'
  end

  def state_name
    accepted? ? "accepted at #{l accepted_at}" : state
  end
end