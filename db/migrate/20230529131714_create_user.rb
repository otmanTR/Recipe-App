class CreateUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :name
      
    end
  end
end
