class CreateRides < ActiveRecord::Migration
  # Write your migrations here
  def change
    create_table :rides do |t|
      t.belongs_to :user
      t.belongs_to :attraction
    end
  end
end
