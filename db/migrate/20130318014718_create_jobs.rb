class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :filled
      t.string :company_name
      t.string :website
      t.string :contact_email
      t.string :user_id

      t.timestamps
    end
    add_index :jobs, :user_id
  end
end
