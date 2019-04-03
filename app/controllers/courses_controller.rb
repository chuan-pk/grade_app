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
      flash[:notice] = "#{@course.name} was successfully created"
      redirect_to courses_path
    else
      flash[:warning] = 'something wrong'
      redirect_to courses_path
    end
  end

  def edit
      @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(allowed_params)
        flash[:notice] = "#{@course.name} was successfully updated."
        redirect_to course_path(@course)
    else
      flash[:warning] = 'something wrong'
      redirect_to course_path
    end
  end

  def show
    course_id = params[:id]
    @course = Course.find(course_id)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Course ’#{@course.name}’ deleted."
    redirect_to courses_path
  end

  private
  def allowed_params
    params.require(:course).permit(:course_id, :name, :detail, :credit)
  end
end
