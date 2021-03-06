class CreateUserData < ActiveRecord::Migration[7.0]
  def change
    create_table :user_data do |t|
      t.integer :user_id
      t.string :name
      t.string :location
      t.string :contact
      t.date :birth_date
      t.string :nationality
      t.string :resume
      t.string :status

      t.timestamps
    end
  end
end
