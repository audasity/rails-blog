FactoryBot.define do
    
    factory :article do
        user_id { "1" }
        title { "Title" }
        body { "this is the body of the test title" }
        created_at { "2023-01-09 10:17:05.118107000 +0000" }
        updated_at { "2023-01-09 10:17:05.118107000 +0000" }
        status { "public" }
    end
end