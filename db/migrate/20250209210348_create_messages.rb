class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.string :sender
      t.string :recipient
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
