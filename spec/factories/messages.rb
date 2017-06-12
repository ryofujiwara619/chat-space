FactoryGirl.define do

  factory :message do
    body     Faker::Name.name
    image    File.open('spec/fixtures/files/sample.png')
    user_id  "1"
    group_id "1"
  end

end