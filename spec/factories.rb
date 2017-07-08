FactoryGirl.define do
  factory :event do
    title
    description
    organizer_id
    start_date
    end_date
    show_remaining
    source
    shareable
    category_id
    listed
  end
end
