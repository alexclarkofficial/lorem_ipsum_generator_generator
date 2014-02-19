class CreateGenerators < ActiveRecord::Migration
  def change
    create_table :generators do |t|
      t.string :name
      t.string :tagline
      t.string :sub_tagline

      t.timestamps
    end
  end
end
