class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :second_name
      t.string :third_name
      t.string :api_key
      t.string :password_digest

      t.timestamps
    end
  end
end
