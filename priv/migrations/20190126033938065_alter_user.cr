class AlterUser < Jennifer::Migration::Base
  def up
    change_table(:users) do |t|
      t.drop_column(:password_hash)
      t.add_column(:password_digest, :string, { default: ""})
    end
  end

  def down
    change_table(:users) do |t|
      t.drop_column(:password_digest)
      t.add_column(:password_hash, :string, { default: "" })
    end
  end
end
