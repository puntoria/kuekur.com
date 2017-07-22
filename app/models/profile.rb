class Profile
  include ActiveModel::Model

  attr_accessor :user

  delegate(
    :email,
    :email=,
    :name,
    :name=,
    :gender,
    :gender=,
    :birth_date,
    :birth_date=,
    :gender,
    :gender=,
    :age, 
    :age=,
    :email_verified,
    :email_verified=,
    :phone_number,
    :phone_number=,
    :phone_verified,
    :phone_verified=,
    to: :user
  )
end
