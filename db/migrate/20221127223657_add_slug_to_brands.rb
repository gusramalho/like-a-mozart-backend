class AddSlugToBrands < ActiveRecord::Migration[7.0]
  def change
    add_column :brands, :slug, :string

    Brand.all.each do |b|
      b.slug = b.name.parameterize
      b.save
    end

    add_index :brands, :slug, unique: true
    change_column :brands, :slug, :string, null: :false
  end
end
