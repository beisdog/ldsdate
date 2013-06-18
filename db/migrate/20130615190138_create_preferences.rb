class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.boolean :visible_to_others
      t.integer :look_young_age
      t.integer :look_old_age
      t.integer :hide_for_younger
      t.integer :hide_for_older
      t.integer :height_from
      t.integer :height_to
      t.string  :smokes
      t.string  :drinks
      t.string  :body_type
      t.integer :body_type_importance
      t.string  :hair_color
      t.integer :hair_color_importance
      t.string  :ethnicity
      t.integer :ethnicity_importance
      t.boolean :partner_with_children
      t.string  :look_for
      t.string  :income
      t.integer :income_importance
      t.string  :countries
      t.integer :max_distance
      t.string  :moving
      t.integer :user_id
    end
  end
end
