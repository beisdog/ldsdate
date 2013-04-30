class AddToUserFb < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :fb_id, :bigint
    add_column :users, :fb_url, :string
    add_column :users, :fb_locale, :string
    add_column :users, :fb_profpic_s, :string
    add_column :users, :fb_profpic_m, :string
    add_column :users, :fb_profpic_l, :string
    add_column :users, :fb_access_token, :string


  end

end
