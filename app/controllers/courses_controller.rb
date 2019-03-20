class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(allowed_params)
    if @course.save
      flash[:notice] = '#{course.name} was successfully created'
      redirect_to courses_path
    else
      flash[:warning] = 'something wrong'
      redirect_to courses_path
    end
  end


  private
  def allowed_params
    params.require(:course).permit(:course_id, :name, :detail, :credit)
  end
end
