class AlterColumnOnJobs < ActiveRecord::Migration
  def up
    change_column :jobs, :filled, :boolean, default: false
  end

  def down
    change_column :jobs, :filled, :string
  end
end
