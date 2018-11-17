class AddColumnPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :varchar
    remove_column :users,:pass,:string
  end
end
