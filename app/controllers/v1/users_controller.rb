class V1::UsersController < V1::BaseController
  def index
      @users=User.all
    render json: @users
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
    # respond_to? do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'Result was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

   private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end


end
