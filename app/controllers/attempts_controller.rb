class AttemptsController < ApplicationController
  before_action :has_student_and_course,  only: [:new, :create]
 
  
  protected
  def has_student_and_course
    unless @current_user
      flash[:warning] = "You must logged in to attempt course."
      redirect_to '/login'
    end
    unless (@course = Course.where(:course_id => params[:course_id]))
      flash[:warning] = "Course must exits"
      redirect_to '/courses'
    end
  end

  public
  def new
    @course = Course.find(params[:course_id])
    @attempt = @course.attempts.new
  end
  def create
    @student = @current_user
    @course = Course.find(params[:course_id])
    @attempt = Attempt.new(allowed_params)
    @attempt.course_id = @course.course_id
    @attempt.student_id = @student.student_id
    @attempt.save
    redirect_to course_path(@course)
  end

  def attempt_courses
    @courses = []
    7.times do
      @courses << Attempt.new
    end
  end

  def confirm
    @student = @current_user
    @year = params[:course][:year]
    @semester = params[:course][:semester]
    params["courses"].each do |course|
      @attempt = Attempt.new(attempt_params(course))
      @attempt.student_id = @student.student_id
      @attempt.year = @year
      @attempt.semester = @semester
      @attempt.save
    end
    redirect_to courses_path
  end
  
  private
  def allowed_params
    params.require(:attempt).permit(:grade, :year, :semester,)
  end
  def attempt_params(my_params)
    my_params.permit(:grade, :course_id)
  end

end