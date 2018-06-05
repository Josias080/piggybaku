class FeelingsController < ApplicationController
   skip_before_action :authenticate_user!, only: :new
   before_action :set_feeling, only: [ :show, :edit, :update, :destroy ]


  def index
      @positive_feelings = Feeling.all.where(user: current_user, is_positive: true).order(id: "DESC")
      @negative_feelings = Feeling.all.where(user: current_user, is_positive: false).order(id: "DESC")
  end

  def show
  end

  def new
    @feeling = Feeling.new
  end

  def create
    @feeling = Feeling.new(feeling_params)
    @feeling.user = current_user
    if @feeling.save
      redirect_to feeling_path(@feeling)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @feeling.update(feeling_params)
      redirect_to feeling_path(@feeling)
    else
      render :edit
    end
  end

  def destroy
    @feeling.destroy
    redirect_to root_path
  end

  private

  def feeling_params
    params.require(:feeling).permit(:content, :price_cents, :is_positive)
  end

  def set_feeling
    @feeling = Feeling.find(params[:id])
  end
end
