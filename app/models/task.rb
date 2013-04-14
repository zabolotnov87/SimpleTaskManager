class Task < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  has_many :comment, dependent: :delete_all

  before_save :correct_state

  #validation
  validates :name, presence: true

  state_machine :state, initial: :new do
    before_transition any => :accepted do |task, _|
      task.accepted_at = Time.zone.now
    end

    event :start do
      transition [:new, :rejected] => :started, if: lambda {|task| task.has_owner?}
    end

    event :finish do
      transition :started => :finished
    end

    event :accept do
      transition :finished => :accepted
    end

    event :reject do
      transition :finished => :rejected
    end
  end

  def has_owner?
    user_id?
  end

  def comments
    Comment.where(task_id: id)
  end

  def owner_name
    if has_owner?
      user.email
    else
      '<none>'
    end
  end

  private

  def correct_state
    self.state = :new unless has_owner?
  end
end
