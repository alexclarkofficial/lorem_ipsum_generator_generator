class CreateLoremIpsums < ActiveRecord::Migration
  def change
    create_table :lorem_ipsums do |t|
      t.text :content
      t.integer :generator_id

      t.timestamps
    end
    add_index :lorem_ipsums, :generator_id
  end
end
