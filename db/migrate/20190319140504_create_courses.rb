class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses, {id: false, primary_key: :course_id} do |t|
      t.string :course_id, null: false
      t.string 'name'
      t.text 'detail'
      t.integer 'credit'
    end
  end
  
  def down
    drop_table 'courses'
  end
end