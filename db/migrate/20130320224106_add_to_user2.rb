class AddToUser2 < ActiveRecord::Migration
  def change

    add_column :users, :temple_status, :string
    add_column :users, :education , :string
    add_column :users, :education_inst, :string #what uni, school
    add_column :users, :ethnicity , :string
    add_column :users, :income, :string
    add_column :users, :occupation , :string
    add_column :users, :relationship_expectation, :string
    add_column :users, :relationship_status, :string
    add_column :users, :pet, :string
    add_column :users, :political_attitude, :string
    add_column :users, :travel_profile, :string
    add_column :users, :want_more_children, :string
    add_column :users, :welcome_children, :string
    add_column :users, :willing_to_move, :string
    add_column :users, :religious_attitude, :string
    add_column :users, :color_code, :string

  end
  
  
end
