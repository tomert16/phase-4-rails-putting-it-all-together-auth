class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  before_action :authorized

  private

  def current_user
    User.find_by(id: session[:user_id])
  end

  def render_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_found(error)
    render json: { errors: errors.full_messages }, status: :not_found  
  end  

  def authorized
    render json: { errors: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id
end


end
