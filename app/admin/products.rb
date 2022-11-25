ActiveAdmin.register Product do
  permit_params :name, :price, :family, :description, :category_id, :brand_id, :image_url

  form do |f| 
    f.inputs "Products" do
      f.input :name
      f.input :description
      f.input :family
      f.input :category, as: :select, collection: Category.all.map {|b| [b.name, b.id]}
      f.input :brand, as: :select, collection: Brand.all.map {|b| [b.name, b.id]}
      f.input :price
      f.input :image_url
    end
    f.actions
  end
end
