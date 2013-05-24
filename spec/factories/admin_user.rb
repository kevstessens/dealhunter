FactoryGirl.define do
  factory :admin_user do
    email { Forgery(:internet).email_address } #'admin@hotmail.com'
    password '123456'
  end
end