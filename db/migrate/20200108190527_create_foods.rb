class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :calories
      t.string :fat
      t.string :carbs
      t.string :protein
      t.string :portion

      t.timestamps
    end
  end
end
