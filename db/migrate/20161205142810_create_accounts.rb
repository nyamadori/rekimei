class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :encrypted_password
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
