module V1
class SessionsController < BaseController
  def login
    @user = User.find_by_email(params[:login][:email])
      if @user&.authenticate(params[:login][:password])
        token= JsonWebToken.encode(user_id: @user.id, slug: "josh")
        current_user = @user.id
        render json: { message: 'User Login Succesfully', data: {auth_token: token}}, status: :ok
      else
        render json: { error: 'unauthorized User' }, status: :unauthorized
      end
  end

  def decode_token
    # @current_user = token[:user_id]
    # @current_user = params[:token]
    puts "wel"
    puts(current_user.inspect)
    # authentication
    # puts("<<<<<<<<<<<<<<", @current_user[:id])
    # byebug
    # render json: { message: "user found", data: {user: @current_user}}, status: :ok 
  end
  def authenticate_request
    super
  end

  private
  def login_params
    params.require(:login).permit(:email, :password)
  end
end
end
                                    