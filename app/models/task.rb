class Task < ActiveRecord::Base
  attr_accessible :name, :user_id, :state

  belongs_to :user
  has_many :comments, dependent: :delete_all

  before_save :correct_state

  # validation
  validates :name, presence: true

  # scopes
  scope :by_owner, lambda { |user_id| where(user_id: user_id) unless (user_id.nil? || user_id.blank?)}
  scope :by_state, lambda { |state| where(state: state) unless (state.nil? || state.blank?)}
  scope :recent_order, order('created_at desc')

  state_machine :state, initial: :new do
    before_transition any => :accepted do |task, _|
      task.accepted_at = Time.zone.now
    end

    event :start do
      transition [:new, :rejected] => :started, if: lambda { |task| task.has_owner? }
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

  private

  def correct_state
    self.state = :new unless has_owner?
  end
end
