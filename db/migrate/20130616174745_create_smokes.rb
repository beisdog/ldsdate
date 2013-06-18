class CreateSmokes < ActiveRecord::Migration
  def change
    create_table :smokes do |t|
      t.string :name
    end
  end
end
