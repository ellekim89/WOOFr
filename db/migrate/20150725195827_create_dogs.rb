class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.integer :pf_id

      t.timestamps null: false
    end
  end
end
