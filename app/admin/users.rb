ActiveAdmin.register User do

  actions :index
  
  index do 
    column :id
    column :name
    column :surname
    column :email
    column :birthdate
    column :phone
    column :address_zip_code
    column :address_street
    column :address_number
    column :address_complement
    column :address_state
    column :address_city
    column :receive_emails
  end
end
