FactoryGirl.define do
  factory :product, class: Product do
    user
    name 'Osprey Ariel 55'
    description { Forgery('lorem_ipsum').paragraph }
    # image_file_name
    # image_content_type
    # image_file_size
  end
end