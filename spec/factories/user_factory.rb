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
  end

end