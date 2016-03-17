FactoryGirl.define do
  factory :article, class: Article do
    user
    name 'We Learn Nothing'
    content 'Forward march!'
    # image_file_name
    # image_content_type
    # image_file_size
  end
end