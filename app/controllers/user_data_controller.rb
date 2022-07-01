class UserDataController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user_datum, except: %i[create index]

  def show
    render :json => @user_datum
  end

  def update
    if @user_datum.update(user_datum_params)
      render :json => @user_datum
    end
  end

  def update_status
    if @user_datum.update(user_status_params)
      render :json => @user_datum
    end
  end

  def update_resume
  end

  private

  def find_user_datum
    @user_datum = UserDatum.get_user_datum(@current_user.id)
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_datum_params
    params.permit(:name, :location, :contact, :birth_date, :nationality)
  end

  def user_status_params
    params.permit(:status)
  end
end
