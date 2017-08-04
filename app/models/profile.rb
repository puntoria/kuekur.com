class Profile
  include ActiveModel::Model

  attr_accessor :user

  delegate(
    :email,
    :email=,
    :password,
    :password=,
    :name,
    :name=,
    :gender,
    :gender=,
    :birth_date,
    :birth_date=,
    :avatar,
    :avatar=,
    :age,
    :age=,
    :website,
    :website=,
    :phone_number,
    :phone_number=,
    :bio,
    :bio=,
    to: :user
  )

  def update(attributes)
    attributes.each do |method, value|
      public_send("#{method}=", value)
    end

    if valid?
      ActiveRecord::Base.transaction do
        user.save!
      end
    end
  end

  def valid?
    super
    user.validate

    expose_errors

    errors.empty?
  end

private

  def expose_errors
    [
      user
    ].each do |relationship|
      relationship.errors.each do |key, message|
        errors[key] = message
      end
    end
  end
end
