class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :prototype_id
      t.text :content
      t.integer :status
      t.timestamps
    end
  end
end
