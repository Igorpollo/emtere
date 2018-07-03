class CreateEventos < ActiveRecord::Migration[5.2]
  def change
    create_table :eventos do |t|
      t.date :inicio
      t.date :fim
      t.string :nome
      t.text :texto

      t.timestamps
    end
  end
end
