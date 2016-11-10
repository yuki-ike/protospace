FactoryGirl.define do
  factory :content do
     content { fixture_file_upload(Rails.root.to_s + "/spec/fixtures/img/america.jpg", 'image/america.jpg') }
  end

  trait :main do
    status 1
  end

  trait :sub do
    status 2
  end

  factory :main, traits: [:main]
  factory :sub, traits: [:sub]
end
