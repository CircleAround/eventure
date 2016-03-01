FactoryGirl.define do
  factory :user, aliases: [:owner] do
    provider 'twitter'
    sequence(:uid) { |i| "uid#{i}" }
    sequence(:nickname) { |i| "nickname#{i}" }
    sequence(:image_url) { |i| "http://example.com/image#{i}.jpg" }
    sequence(:email) { |i| "test#{i}@test.com" }
    sequence(:password) { |i| "password#{i}" }
    sequence(:username) { |i| "username#{i}" }
  end
end
