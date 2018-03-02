require 'active_support/concern'

module CommonValidator
  extend ActiveSupport::Concern

  include ActiveModel::Dirty

  included do
    before_validation(on: %i[create update]) do
      if attribute_present?('phone_number') && plausible_phone?(phone_number)
        self.phone_number = phone_number
      else
        errors.add(:invalid_phone_number, 'Phone number does not appear to be valid.')
      end
    end
  end

  private

  def plausible_phone?(phone_number)
    phone = PhoneValidator.new
    phone.valid?(phone_number)
  end
end
