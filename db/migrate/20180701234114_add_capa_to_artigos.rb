class AddCapaToArtigos < ActiveRecord::Migration[5.2]
  def change
    add_column :artigos, :capa, :string
  end
end
