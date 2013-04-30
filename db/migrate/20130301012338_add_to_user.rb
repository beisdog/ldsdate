class AddToUser < ActiveRecord::Migration
  def change
    add_column :users, :locale , :string
    #add_column :users, :firstname , :string
    #add_column :users, :lastname , :string
    add_column :users, :whatilookfor , :text
    add_column :users, :height_cm, :integer
    add_column :users, :weight_kg, :integer
    add_column :users, :body_type, :string
    add_column :users, :hair_color, :string
    add_column :users, :eye_color, :string
    
    #children and relationshipstatus
    add_column :users, :divorced, :boolean
    add_column :users, :children, :integer
    add_column :users, :children_home, :integer
    
    #church info
    add_column :users, :church_attendance, :string
    add_column :users, :ward , :string
    add_column :users, :stake , :string
    add_column :users, :served_mission, :boolean
    add_column :users, :mission_location , :string
    add_column :users, :mission_from, :integer
    add_column :users, :mission_to, :integer
    
  end

end
