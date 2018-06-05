class FeelingsController < ApplicationController

  def show
  end
  def new
    @feeling = Feeling.new
  end
end
