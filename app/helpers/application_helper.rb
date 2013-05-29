module ApplicationHelper

  def owner_name(task)
    task.has_owner? ? task.user.email : '<none>'
  end

  def state(task)
    task.accepted? ? "accepted at #{l task.accepted_at}" : task.state
  end
end
