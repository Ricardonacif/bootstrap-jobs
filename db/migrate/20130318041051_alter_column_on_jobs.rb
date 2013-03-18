class AlterColumnOnJobs < ActiveRecord::Migration
  def up
    remove_columns :jobs, :filled
    add_column :jobs, :filled, :boolean, default: false
  end

  def down
    remove_columns :jobs, :filled
    add_column :jobs, :filled, :string
  end
end
