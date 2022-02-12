class CreateIdeas < ActiveRecord::Migration[7.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :content
      t.integer :student_id

      t.timestamps
    end
  end
end
