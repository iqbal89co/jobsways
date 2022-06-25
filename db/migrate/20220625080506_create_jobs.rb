class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :company_datum, foreign_key: true
      t.string :title
      t.string :position
      t.float :salary
      t.float :salary_upto
      t.string :location
      t.string :job_type
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
