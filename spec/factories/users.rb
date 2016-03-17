FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user, class: User do
    first_name "Channing"
    last_name "Allen"
    email
    password "$232#qu@driv!um$@%"
    role { User::ROLES.sample }
    created_at { 2.days.ago }
    updated_at { 1.day.ago }
  end
end