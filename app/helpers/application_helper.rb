module ApplicationHelper
  def format_date(date)
    date.strftime("%d %b %H:%M")
  end

  def owner_name(task)
    task.has_owner? ? task.user.email : '<none>'
  end

  def state(task)
    task.accepted? ? "accepted at #{format_date(task.accepted_at)}" : task.state
  end
end
