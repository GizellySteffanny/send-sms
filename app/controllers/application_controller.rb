class ApplicationController < ActionController::Base
  def redirect_if_unverified
    if logged_in? && !current_user.verified?
      redirect_to new_verify_url, notice: "Please verify your phone number"
    end
  end
end
