class CreateSearchSetting < ActiveRecord::Migration
  def change
    create_table :user_search_settings do |t|
      t.integer :user_id
      t.boolean :show_males
      t.boolean :show_females
      t.integer :age_from
      t.integer :age_to
      t.integer :height_cm_min
      t.integer :height_cm_max
      t.string :zip
      t.boolean :show_only_only
      t.string :country_ids
      t.string :ward
      t.string :stake 
      t.timestamps
    end
  end
end
