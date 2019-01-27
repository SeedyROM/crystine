class CreateUser < Jennifer::Migration::Base
  def up
    create_table(:users) do |t|
      t.string :email, {:size => 128, :null => false}
      t.string :password_digest, {:null => false}
      t.bool :is_active, {:default => false}

      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table(:users)
  end
end
