class User < ApplicationRecord
  has_secure_password

  before_validation :normalize_fields

  validates :name, presence: true
  validates :surname, presence: true
  
  validates :email, presence: true,
              uniqueness: { case_sensitive: false },
              length: { minimum: 4, maximum: 254 }
  
  validates :password, presence: true, length: { minimum: 8 }
  validates :birthdate, presence: true
  validates :phone, presence: true
  validates :address_zip_code, presence: true, length: { is: 8 }
  validates :address_street, presence: true
  validates :address_number, presence: true
  validates :address_state, presence: true, length: { is: 2 }
  validates :address_city, presence: true

  private 

  def normalize_fields
    self.email = email&.to_s&.upcase&.strip
    self.name = name&.to_s&.capitalize
    self.surname = surname&.to_s&.capitalize
    self.address_state = address_state&.to_s&.upcase&.strip
    self.address_city = address_city&.to_s&.upcase&.strip
    self.address_street = address_street&.to_s&.upcase&.strip
    self.address_complement = address_complement&.to_s&.upcase&.strip
    self.address_zip_code = normalize_zip_code(address_zip_code)
    self.phone = normalize_phone(phone)
  end

  def normalize_zip_code(zip_code)
    return zip_code&.tr("^0-9", "")   
  end

  def normalize_phone(phone)
    return phone&.tr("^0-9", "")   
  end
end
