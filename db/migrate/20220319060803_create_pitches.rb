class CreatePitches < ActiveRecord::Migration[7.0]
  def change
    create_table :pitches do |t|
      t.string :title
      t.string :tagline
      t.string :logline
      t.text :synopsis
      t.string :slides
      t.datetime :presentation_datetime
      t.references :user, null: false, foreign_key: true
      t.references :idea, null: false, foreign_key: true
      t.references :brief, null: false, foreign_key: true

      t.timestamps
    end
  end
end