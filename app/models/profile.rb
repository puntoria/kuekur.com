class Profile
  include ActiveModel::Model

  attr_accessor :user

  delegate(
    :name,
    :name=,
    :email,
    :email=,
    :password,
    :password=,
    :birth_date,
    :birth_date=,
    :age,
    :age=,
    :avatar,
    :avatar=,
    :gender,
    :gender=,
    :phone_number,
    :phone_number=,
    :website,
    :website=,
    :bio,
    :bio=,
    :created_at,
    # Ehemm?
    :events,
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
