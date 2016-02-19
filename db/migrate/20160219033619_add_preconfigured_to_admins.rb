class AddPreconfiguredToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :preconfigured, :boolean, default: false
  end
end
