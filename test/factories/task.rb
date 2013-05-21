# coding: utf-8

FactoryGirl.define do
  factory :task do
    user
    name 'task_test'
    state 'new'
  end
end
