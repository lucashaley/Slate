class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :student_id
      t.references :idea, null: false, foreign_key: true

      t.timestamps
    end
  end
end
