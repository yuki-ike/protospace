FactoryGirl.define do

  factory :user do
    username              "yuki"
    # image                 ""
    email                 { Faker::Internet.email}
    password              "00000000"
    password_confirmation "00000000"
    member_of             "techcamp"
    profile               "from fukui"
    works                 "free"
  end

end
