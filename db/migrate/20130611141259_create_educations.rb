class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :name
    end
  end
end
