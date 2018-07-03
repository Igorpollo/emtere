class CreateArtigos < ActiveRecord::Migration[5.2]
  def change
    create_table :artigos do |t|
      t.string :titulo
      t.text :texto
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
