class CreateCreatives < ActiveRecord::Migration[7.0]
  def change
    create_table :creatives do |t|
      t.string :position
      t.references :user, null: false, foreign_key: true
      t.references :pitch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
