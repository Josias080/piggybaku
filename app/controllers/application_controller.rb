class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :guest_user?, :current_or_guest_user

  protected

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  # if user is login return current_user else return guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        guest_user(with_retry = false).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object
    def guest_user(with_retry = true)
      @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
    rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
       session[:guest_user_id] = nil
       guest_user if with_retry
    end

    def guest_user?
      current_user && current_user.guest?
    end

    # no login or guest redirect to root_path
    def authenticate_no_user_or_guest!
      redirect_to root_path if current_user.nil? || guest_user?
    end

    # move the date to current user from guest user
    def logging_in
      guest_user.move_to(current_user)
    end

    # create guest user
    def create_guest_user
      guest = User.new_guest
      guest.save!(:validate => false)
      session[:guest_user_id] = guest.id
      guest
    end

end
