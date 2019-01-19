class CreatePost < Jennifer::Migration::Base
  def up
    create_table(:posts) do |t|
      t.string :body
      t.reference :user

      t.timestamps
    end
  end

  def down
    drop_foreign_key(:posts, :users)
    drop_table(:posts)
  end
end
