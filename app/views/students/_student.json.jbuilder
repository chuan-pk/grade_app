json.extract! student, :id, :student_id, :name, :email, :birthdate, :sex, :created_at, :updated_at
json.url student_url(student, format: :json)
