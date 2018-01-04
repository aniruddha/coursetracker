class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.text :body
      t.string :url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end