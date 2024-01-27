class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :description
      t.boolean :in_the_diet
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
