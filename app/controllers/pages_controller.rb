class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :about
  skip_before_action :authenticate_user!, only: :contact

  def home
  end

  def about
  end

  def contact
  end

end
