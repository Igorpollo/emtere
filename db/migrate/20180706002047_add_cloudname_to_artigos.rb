class AddCloudnameToArtigos < ActiveRecord::Migration[5.2]
  def change
    add_column :artigos, :cloudname, :string
  end
end
