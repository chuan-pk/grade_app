class StudentsController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    redirect_to show
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @current_user ||= Student.find_by(student_id: session[:user_id])
    id = params[:id]
    @student = Student.find(id)
    
    @attempt = Attempt.where(student_id: @student.student_id)
    '''Attempt.joins(:student).where(student_id: @student.student_id).each do |record|
      puts "-----"
      puts record.course_id, record.grade
    end'''
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "Student was successfully created."
      redirect_to courses_path
    else
      flash[:warning] = 'something wrong'
      redirect_to courses_path
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @current_user ||= Student.find_by(student_id: session[:user_id])
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def logged_in_user
      unless current_user
        flash[:warning] = 'You must be Login'
        redirect_to :root
      end
    end
    def correct_user
      @student = Student.find(params[:id])
      if @student != current_user
        flash[:warning] = 'Wrong user!!'
        redirect_to :root
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:student_id, :name, :email, :password, :password_confirmation, :birthdate, :sex)
    end
end
