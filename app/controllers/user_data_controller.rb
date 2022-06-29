class UserDataController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  def show
    @user_datum = UserDatum.get_user_datum(params[:id])
    render :json => @user_datum
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
