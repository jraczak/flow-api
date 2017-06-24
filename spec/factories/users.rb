FactoryGirl.define do
	factory :user do
		email { Faker::Internet.email }
		firebase_id { Faker::Lorem.characters(30) } 
		name { Faker::Name.name }
	end
end