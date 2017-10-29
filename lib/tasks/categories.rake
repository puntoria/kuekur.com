if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :seed do
    task categories: :environment do
      include FactoryGirl::Syntax::Methods

      [
      "Auto, Boat & Air",
      "Business & Professional",
      "Charities & Causes",
      "Community & Culture",
      "Family & Education",
      "Fashion & Beauty",
      "Film, Media & Entertainment",
      "Food & Drink",
      "Government & Politics",
      "Health & Wellness",
      "Hobbies & Special Interests",
      "Home & Lifestyle",
      "Other",
      "Performing & Visual Arts",
      "Religion & Spirituality",
      "School Activities",
      "Science & Technology",
      "Seasonal",
      "Sports & Fitness",
      "Travel & Outdoor"
      ].each do |category|
        FactoryGirl.create(
          :category,
          name: category,
          meta_title: category,
          short_name: category,
          long_name: category
        )
      end

      puts "Seed Completed."
    end
  end
end
