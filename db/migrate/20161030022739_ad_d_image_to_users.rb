class AdDImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :text
    add_column :users, :image, :text
    add_column :users, :member_of, :text
    add_column :users, :profile, :text
    add_column :users, :works, :text
  end
end
