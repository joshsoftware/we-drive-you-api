module V1
class UsersController < BaseController
 # before_filter :index

def index
  @users = User.all
  render json: @users
  # # c_u = @users.id

end
def show
  @users = User.all
  render json: @users
end 

def create
  @user = User.new(user_params)
  if @user.save
    render json: @user, status: :created
  else
    render json: { errors: @user.errors.full_messages },
    status: :unprocessable_entity
  end
  end

def user_params

  # p params "=+++++++++++++++++++status"
  params.permit(
    :name, :email, :password
    )
end
end
end