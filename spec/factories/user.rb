FactoryBot.define do

    factory :user do
        email { "testemail@testmail.com" }
        password { "blahblah" }
        first_name { "test" }
        last_name { "email" }
    end
end