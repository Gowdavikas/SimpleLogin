class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!

  respond_to :json

  def respond_with(resource, _opts = {})
    token = request.env['warden-jwt_auth.token']
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.valid_password?(params[:user][:password]) 
      sign_in @user
        response_data = {
          message: "User logged In successfully",
          meta: {
            token: token
          } 
        }
        render json: response_data
    else
      render json: {message: "Incorrect email or password"}, status: 404
    end
  end
end
