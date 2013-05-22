# coding: utf-8

FactoryGirl.define do
  factory :task do
    user
    name
    state 'new'
  end
end
