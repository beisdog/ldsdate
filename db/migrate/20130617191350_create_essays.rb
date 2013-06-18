class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.text :about_me
      t.text :looking_for
      t.text :contact_my_if
      t.text :influential_person
      t.text :notice_about
      t.text :wish_to_notice
      t.text :five_things
      t.text :leisure_time
      t.text :passionate_about
      t.text :thankfull_for
      t.text :friends_say
      t.text :friday_night
      t.integer :user_id
    end
  end
end
