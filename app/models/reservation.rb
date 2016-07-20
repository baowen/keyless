class Reservation < ActiveRecord::Base
  VALID_PHONE_NUMBER_REGEX = /[0-9]{11}/x
  validates :mobile, presence: true, length: {maximum: 11}, format: { with: VALID_PHONE_NUMBER_REGEX,
    message: "only allow valid international phone numbers" }
end
