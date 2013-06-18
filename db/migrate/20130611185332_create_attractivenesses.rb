class CreateAttractivenesses < ActiveRecord::Migration
  def change
    create_table :attractivenesses do |t|
      t.string :name
    end
  end
end
