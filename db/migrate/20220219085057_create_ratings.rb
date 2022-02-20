class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :impact
      t.integer :viability
      t.integer :student_id
      t.references :idea, null: false, foreign_key: true
      # t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
