FactoryGirl.define do
  factory :article, class: Article do
    user
    name "We Learn Nothing"
    content "Forward march!"
  end
end