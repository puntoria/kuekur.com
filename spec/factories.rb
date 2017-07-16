FactoryGirl.define do
  sequence :title do |n|
    "title #{n}"
  end
  sequence(:email) do |n|
    "user#{n}@example.com"
  end
  sequence :name do |n|
    "name #{n}"
  end

  factory :user do
    name
    email
    password "password"
    avatar File.new("#{Rails.root}/public/default.jpg")
  end

  factory :event do
    title
    description "Students will learn how to program basic games that integrate arcade-like physical components."
    url "building-interactive-games-with-raspberry-pi-ages-9-to-12-registration"
    start_date 1.week.ago
    end_date 1.day.ago
    created 1.week.ago
    updated 2.days.ago
    shareable 
    show_remaining
    listed
    invite_only
    status 0
    capacity 100
    source "facebook.com/interactive-games"
  end
  
  trait :shareable do 
    shareable true
  end

  trait :show_remaining do 
    show_remaining true
  end

  trait :listed do 
    listed true
  end

  trait :invite_only do 
    invite_only true
  end
end
