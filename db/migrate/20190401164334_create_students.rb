class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students, {id: false, primary_key: :student_id}  do |t|
      t.string :student_id
      t.string :name
      t.string :email
      t.string :password_digest
      t.datetime :birthdate
      t.string :sex
    end
    add_index :students, :student_id, unique: true
    add_index :students, :email, unique: true
  end
end
