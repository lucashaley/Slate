class CreateBriefs < ActiveRecord::Migration[7.0]
  def change
    create_table :briefs do |t|
      t.string :title
      t.string :tagline
      t.text :overview
      t.string :url
      t.text :core_deliverable
      t.text :supplementary_deliverable
      t.string :core_criteria_title
      t.text :core_criteria_body
      t.string :modeled_after
      t.string :modeled_after_url

      t.timestamps
    end
  end
end
