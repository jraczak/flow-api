FactoryGirl.define do
	factory :task do
		user_id { Faker::Lorem.characters(30) }
		local_realm_id { Faker::Lorem.characters(3) }
		name { Faker::Lorem.word }
		note { Faker::Lorem.words(15) }
		original_scheduled_date '05/27/2017'
		current_scheduled_date '08/27/2017'
		migration_count { Faker::Number(2) }
		complete { Faker::Boolean.boolean }
	end
end