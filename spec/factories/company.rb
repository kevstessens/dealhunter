FactoryGirl.define do
  factory :company do
    user
    name { Forgery::LoremIpsum.sentence(random: true) }
  end
end