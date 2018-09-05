class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    find_id
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    if @student.valid?
      redirect_to @student
    else
      render :new
    end
  end

  def update
    find_id
    @student.update(student_params)
    if @student.valid?
      redirect_to @student
    else
      render :edit
    end
  end

  def edit
    find_id
  end

  def destroy
    find_id
    @student.destroy
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :mod)
  end

  def find_id
    @student = Student.find(params[:id])
  end

end
