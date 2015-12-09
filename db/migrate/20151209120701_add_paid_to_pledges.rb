class AddPaidToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :paid, :boolean
  end
end
