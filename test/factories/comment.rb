# coding: utf-8

FactoryGirl.define do
  factory :comment do
    user
    task
    body
  end
end
