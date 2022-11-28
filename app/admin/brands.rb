ActiveAdmin.register Brand do
  permit_params :name, :active

  form do |f| 
    f.inputs "Brands" do
      f.input :name
      f.input :active
      f.input :slug, input_html: { disabled: true }
    end
    f.actions
  end
end
