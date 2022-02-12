class CreateRealms < ActiveRecord::Migration[7.0]
  def change
    create_table :realms do |t|
      t.string :title
      t.string :color

      t.timestamps
    end
  end
end
