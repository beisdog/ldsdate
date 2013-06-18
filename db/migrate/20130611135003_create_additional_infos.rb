class CreateAdditionalInfos < ActiveRecord::Migration
  def change
    create_table :additional_infos do |t|
      t.string :want_kids
      t.integer :body_type_id
      t.integer :user_id
      t.string :bodytype
      t.string :height
      t.boolean :show_weight
      t.text :looks
      t.integer :hair_color_id
      t.integer :eye_color_id
      t.integer :attractiveness_id
      t.text :handicap
      t.boolean :show_handicap
      t.string :ward
      t.string :stake
      t.integer :relationship_status_id
      t.integer :education_id
      t.text :occupation
      t.text :university
    end
  end
end
