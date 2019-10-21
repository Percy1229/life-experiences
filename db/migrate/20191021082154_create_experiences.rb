class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.integer :year, limit: 2
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
