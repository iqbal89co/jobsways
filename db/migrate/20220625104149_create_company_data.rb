class CreateCompanyData < ActiveRecord::Migration[7.0]
  def change
    create_table :company_data do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :website

      t.timestamps
    end
  end
end
