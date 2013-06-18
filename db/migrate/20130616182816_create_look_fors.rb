class CreateLookFors < ActiveRecord::Migration
  def change
    create_table :look_fors do |t|
      t.string :name
    end
  end
end
