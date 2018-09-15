# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false

      # magic_login
      t.string :magic_login_token, default: nil
      t.datetime :magic_login_token_expires_at, default: nil
      t.datetime :magic_login_email_sent_at, default: nil
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end
    add_index :users, :magic_login_token
  end
end
