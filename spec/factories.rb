FactoryGirl.define do
  factory :bookmark do
    user nil
    event nil
  end
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
    age 22
    birth_date Date.today - 22.years
    gender 0
    website "https://mozaixllc.com"
    bio "And your forms will use this information to render the components for you."
    phone_number "+1-541-754-3010"
    email_verified true
    phone_verified  true
    avatar File.new("#{Rails.root}/public/default.jpg")
  end

  factory :event do
    association :user, factory: :user, strategy: :build

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
    status :started
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

  # Event: Statuses
  trait :started do
    listed
    status :started
  end

  trait :ended do
    listed
    status :ended
  end

  trait :live do
    listed
    status :live
  end
end
