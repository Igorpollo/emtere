class AddSlugToArtigos < ActiveRecord::Migration[5.2]
  def change
    add_column :artigos, :slug, :string
  end
end
