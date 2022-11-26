ActiveAdmin.register User do

  actions :index
  
  index do 
    column :name
    column :surname
    column :email
    column :birthdate
    column :phone
    column :receive_emails
  end
end
