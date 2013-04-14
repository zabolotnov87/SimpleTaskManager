class User < ActiveRecord::Base
  attr_accessible :email, :password

  has_many :tasks, dependent: :nullify
  has_many :comments, dependent: :delete_all

  has_secure_password
end
