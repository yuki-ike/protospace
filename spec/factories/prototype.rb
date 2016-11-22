FactoryGirl.define do
  factory :prototype do

    title { Faker::Name.name }
    catch_copy { Faker::Name.title }
    concept { Faker::Name.name }

  end

end
