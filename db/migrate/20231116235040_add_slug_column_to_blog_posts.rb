class AddSlugColumnToBlogPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_posts, :slug, :string, unique: true
  end
end
