class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :mark_for_deletion

      t.timestamps
    end
  end
end
