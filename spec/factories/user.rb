# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'blahblah' }
    first_name { 'test' }
    last_name { 'email' }
  end
end
