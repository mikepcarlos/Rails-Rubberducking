class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    find_id
  end

  def new
    @duck = Duck.new
  end

  def create
    @duck = Duck.create(duck_params)
    if @duck.valid?
      redirect_to @duck
    else
      render :new
    end
  end

  def update
    find_id
    @duck.update(duck_params)
    if @duck.valid?
      redirect_to @duck
    else
      render :edit
    end
  end

  def edit
    find_id
  end

  def destroy
    find_id
    @duck.destroy
    redirect_to ducks_path
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

  def find_id
    @duck = Duck.find(params[:id])
  end

end
