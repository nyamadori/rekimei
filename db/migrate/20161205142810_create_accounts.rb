class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :email, null: false, default: ''
      t.string :password_digest, null: false, default: ''

      t.timestamps
    end
  end
end
