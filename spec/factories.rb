FactoryGirl.define do
  sequence(:title) { |i| "Building Interactive Games with Raspberry #{i}"}

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
    status 1
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
