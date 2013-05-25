class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :sender_id
      t.string :sender_status
      t.integer :receiver_id
      t.string :receiver_status
    end
  end
end
