class CreateAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :attempts do |t|
      t.string :grade
      t.integer :year
      t.integer :semester

      t.string :student_id, references: :students
      t.string :course_id, references: :courses
      t.timestamps
    end
  end
end
