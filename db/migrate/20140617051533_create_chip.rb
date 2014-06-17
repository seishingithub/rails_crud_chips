class CreateChip < ActiveRecord::Migration
  def change
    create_table :chips do |t|
      t.string :chip_type
      t.string :main_ingredient
    end
  end
end
