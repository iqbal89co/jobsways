class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index 
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      @user_datum = UserDatum.new(:user_id => @user.id, :name => params[:name])
      if @user_datum.save
        render json: @user_datum, status: :created
      else
        @user.destroy
        render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
      end
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  # def destroy
  #   @username = @user.username
  #   if @user.destroy
  #     render json: { message: "successfully delete #{@username}" },
  #            status: :ok
  #   end
  # end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :username, :email, :password, :password_confirmation
    )
  end
end