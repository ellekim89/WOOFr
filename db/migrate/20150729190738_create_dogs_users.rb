class CreateDogsUsers < ActiveRecord::Migration
  def change
    create_table :dogs_users do |t|
      t.references :dog, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
