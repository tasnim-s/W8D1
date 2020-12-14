class CreatePostsubs < ActiveRecord::Migration[5.2]
  def change
    create_table :postsubs do |t|
      t.integer :post_id
      t.integer :sub_id

      t.timestamps
    end
    add_index :postsubs, :post_id
    add_index :postsubs, :sub_id
  end
end
