class AddToPostShortDescription < ActiveRecord::Migration
  def change
    add_column :posts, :short_description , :text
    add_column :posts, :locale , :string
    add_column :posts, :parent_id , :integer



  end
end
