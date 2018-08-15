class DucksController < ApplicationController

  def index
    @ducks = Duck.all
    render :index
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def new
    @duck = Duck.new
  end

  def create
    # byebug
    @duck = Duck.new(duck_params)
    if @duck.save
      redirect_to duck_path(@duck)
    else
      flash[:errors] = @duck.errors.full_messages
      render :new
    end
  end

  def edit
    @duck = Duck.find(params[:id])
  end

  def update
    @duck = Duck.find(params[:id])
    if @duck.update(duck_params)
      redirect_to duck_path(@duck)
    else
      render :edit
    end
  end

  private
  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

end
