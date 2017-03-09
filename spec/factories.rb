FactoryGirl.define do
  factory :game do
    
  end
  sequence :email do |n|
    "ping-pong-player#{n}@regalii.com"
  end

  factory :user do
    email
    password "default-password"
  end

end