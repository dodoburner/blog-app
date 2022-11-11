class Api::ApiController < ApplicationController
  attr_reader :current_user

  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  before_action :set_default_format
  before_action :authenticate_token!

  private

  def set_default_format
    request.format = :json
  end

  def authenticate_token!
    payload = JsonWebToken.decode(auth_token)
    @current_user = User.find(payload['user_id'])
  rescue JWT::DecodeError
    render json: { errors: ['Invalid auth token'] }, status: :unauthorized
  end

  def auth_token
    @auth_token ||= request.headers.fetch('Authorization', '').split.last
  end
end
