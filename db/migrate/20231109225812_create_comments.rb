class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :blog_post, null: false, foreign_key: { on_delete: :cascade }
      t.string :author
      t.text :body

      t.timestamps
    end
  end
end
