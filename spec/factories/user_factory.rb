FactoryGirl.define do

  factory :anon_user, class: User do
    name 'John Doe'
    email 'john@example.com'
  end

  factory :valid_user, class: User do
    name 'Jane Doe'
    email 'jane@example.com'
    password '123456'
    password_confirmation '123456'
    after(:create) { |user| 3.times { |i| user.favorites << FactoryGirl.create(:favorite, user_name: "fav#{i}" ) } }
  end

end
