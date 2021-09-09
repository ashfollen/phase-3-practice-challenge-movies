class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.integer :movie_id
      t.integer :actor_id
      t.integer :salary
      t.string :character_name 
    end 
  end
end
