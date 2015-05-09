class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :permalink
      t.text :subheading

      t.timestamps null: false
    end
  end
end
