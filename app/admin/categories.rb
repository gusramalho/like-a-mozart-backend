ActiveAdmin.register Category do
  permit_params :name, :active

  form do |f| 
    f.inputs "Categories" do
      f.input :name
      f.input :active
      f.input :slug, input_html: { disabled: true }
    end
    f.actions
  end
end
