class CreateAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :attempts do |t|
      t.string :grade
      t.integer :year
      t.integer :semester

      t.references :student
      t.references :course
      t.timestamps
    end
  end
end
