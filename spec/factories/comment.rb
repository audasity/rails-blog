# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    commenter { 'Bob' }
    body { 'this is the body of the test title' }
    status { 'public' }
  end
end
