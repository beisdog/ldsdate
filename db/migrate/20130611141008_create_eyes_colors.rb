class CreateEyesColors < ActiveRecord::Migration
  def change
    create_table :eyes_colors do |t|
      t.string :name
    end
  end
end
