class FeelingsController < ApplicationController
   skip_before_action :authenticate_user!, only: [ :new, :create ]
   before_action :set_feeling, only: [ :show, :edit, :update, :destroy ]

  def index
    # if current_or_guest_user
      # @positive_feelings = current_or_guest_user.feelings.where(user: current_user, is_positive: true).order(id: "DESC")
    @negative_feelings = Feeling.where(user: current_or_guest_user, is_positive: false).order(id: "DESC")
    # end
  end

  def show
  end

  def new
    @feeling = Feeling.new
  end

  def create
    @feeling = Feeling.new(feeling_params)
    @feeling.user = current_or_guest_user
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
