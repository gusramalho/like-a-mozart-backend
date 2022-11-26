class UserBlueprint < Blueprinter::Base
  identifier :id
  field :name
  field :surname
  field :email
  field :birthdate
  field :phone
  field :address_zip_code
  field :address_street
  field :address_number
  field :address_complement
  field :address_state
  field :address_city
  field :receive_emails
end
