# coding: utf-8

FactoryGirl.define do
  factory :comment do
    user
    task
    body 'hello world'
  end
end
