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

  factory :event do
    user
    location
    category
    organizer

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
    status :published
    capacity 100
    image File.new("#{Rails.root}/public/press-conference.jpg")
    source "facebook.com/interactive-games"

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

    trait :published do
      listed
      status :published
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

    factory :admin do
      admin true
    end
  end

  factory :organizer do
    name "The Cheese Bar #{(1..5).to_a.sample}"
    description "London Cheese Project"
    long_description "Organiser of London Cheese Project - Winter"
    logo "https://scontent.fprx1-1.fna.fbcdn.net/v/t45.5328-0/c5.5.138.138/p148x148/19490811_1522539527798501_4803921079489789952_n.jpg?oh=9d495a33f56bd92aeef1e0ca339c4142&oe=5A758D39"
    website "http://thecheesebar.ca"
    twitter "thecheesebar.ca"
    facebook "thecheesebar.ca"
    instagram "thecheesebar.ca"
  end

  factory :location do
    address "123 Fake St."
    city "New Jersey"
    country "USA"
    latitude "39.833851"
    longitude "-74.871826"
    long_name "123 Fake St."
    short_name "Fake St."
    types nil
    formatted_address "123, Fake St."
    location_type "bussiness"
    place_id nil
  end

  factory :category do
    name "Religion & Spirituality"
    meta_title "Religion & Spirituality"
    short_name "Religion"
    long_name "Religion & Spirituality"
  end

end
