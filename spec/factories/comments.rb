FactoryGirl.define do
  factory :comment, class: Comment do
    user
    content "This is a wonderfully short comment on an article."
    article
  end
end