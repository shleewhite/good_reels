class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  add_index :movies, [:user_id, :created_at]
  end
end
