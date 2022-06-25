class CreateUserData < ActiveRecord::Migration[7.0]
  def change
    create_table :user_data do |t|
      t.string :name
      t.string :location
      t.string :contact
      t.date :birth_date
      t.string :nationality

      t.timestamps
    end
  end
end
