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
    @attempt.course_id = @course.id
    @attempt.student_id = @student.id
    @attempt.save
    redirect_to course_path(@course)
  end
end