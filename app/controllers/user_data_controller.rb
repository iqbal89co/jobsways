class UserDataController < ApplicationController
  def show
    @user_datum = UserDatum.get_user_datum(params[:id])
    render :json => @user_datum
  end
  
  def create
    @user_datum = UserDatum.new(user_datum_params)
    @user_datum.save
  end

  def update
    @user_datum = UserDatum.get_user_datum(params[:id])
    @user_datum.update(user_datum_params)
  end

  private
  def user_datum_params
    params.require(:user_datum).permit(:name, :location, :contact, :birth_date, :nationality)
  end
end
