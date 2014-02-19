class AddApprovedToLoremIpsums < ActiveRecord::Migration
  def change
    add_column :lorem_ipsums, :approved, :string, default: false
  end
end
