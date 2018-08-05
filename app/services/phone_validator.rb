require 'twilio-ruby'

class PhoneValidator
  def valid?(phone_number)
    request = client.phone_numbers.get(
      phone_number,
      type: 'carrier'
    )
    begin
      request.phone_number
      true
    rescue StandardError => e
      if e.code == 20_404
        return false
      else
        Rails.logger.fatal(e)
        return
      end
    end
  end

  def check_type; end

  def check_number_format; end

  def identify_carrier; end

  def find_caller_name; end

  private

  def client
    Twilio::REST::LookupsClient.new(
      '',
      ''
    )
  end
end
