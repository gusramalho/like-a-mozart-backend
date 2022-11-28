class AddSlugToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :slug, :string

    Category.all.each do |b|
      b.slug = b.name.parameterize
      b.save
    end

    add_index :categories, :slug, unique: true
    change_column :categories, :slug, :string, null: :false
  end
end
  