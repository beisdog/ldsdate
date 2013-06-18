class CreateHairColors < ActiveRecord::Migration
  def change
    create_table :hair_colors do |t|
      t.string :name
    end
  end
end
