FactoryGirl.define do	

	factory :place do
		name "Restaurant"
		description "Delicious Food"
		address "123 Fake Street"
		association :user
	end

	factory :user do
		sequence :email do |n|
			"person#{n}@example.com"
		end
		password "password"
		password_confirmation "password"
	end

	factory :comment do
		message "Really great meal"
		rating "3_stars"
		association :user
		association :place
	end

	factory :photo do
		caption "Fab decor"
		place_id "1"
		picture "table.jpg"
		association :place
	end

end