class FeelingsController < ApplicationController
   skip_before_action :authenticate_user!, only: [ :new, :create ]
   before_action :set_feeling, only: [ :bury, :like, :show, :confirmation, :edit, :update, :destroy ]

  def index
    # if current_or_guest_user
      # @positive_feelings = current_or_guest_user.feelings.where(user: current_user, is_positive: true).order(id: "DESC")
    @feelings = Feeling.where(user: current_or_guest_user).order(id: "DESC")
    # end
    @negative_count = @feelings.where(is_positive: false).count
    @positive_count = @feelings.where(is_positive: true).count
    @week_feelings = @feelings.group_by { |f| f.created_at.strftime('%a') }
    @month_feelings = @feelings.group_by { |f| f.created_at.strftime('%b')}
  end

  def show
  end

  def confirmation
    @price = @feeling.price_cents
  end

  def memory
    @memory_feelings = Feeling.where(is_buried: true).order(id: "DESC")
  end

  def bury
    @feeling.update(is_buried: true)
    redirect_to memory_feelings_path
  end

  def like
    @feeling.flowers += 1
    @feeling.save
    respond_to do |format|
      format.html { redirect_to memory_feelings_path }
      format.js
    end
  end

  def new
    @feeling = Feeling.new
    @feeling.price_cents = nil
  end

  def create
    @feeling = Feeling.new(feeling_params)
    @feeling.user = current_or_guest_user
    if @feeling.save
      redirect_to confirmation_feeling_path(@feeling)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @feeling.update(feeling_params)
      redirect_to feelings_path
    else
      render :edit
    end
  end

  def destroy
    @feeling.destroy
    redirect_to feelings_path
  end

  private

  def feeling_params
    params.require(:feeling).permit(:content, :price_cents, :is_positive)
  end

  def set_feeling
    @feeling = Feeling.find(params[:id])
  end
end
