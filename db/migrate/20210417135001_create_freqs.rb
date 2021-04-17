class CreateFreqs < ActiveRecord::Migration[6.1]
  def change
    create_table :freqs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: {to_table: :users}
      t.integer :status
      t.string :request_message
      t.string :response_message

      t.timestamps
    end
  end
end
