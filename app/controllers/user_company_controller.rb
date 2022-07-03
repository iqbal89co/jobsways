class UserCompanyController < ApplicationController
  before_action :authorize_request
  before_action :find_company, except: :create

  def create
    @company_datum = CompanyDatum.new(company_params)
    if @company_datum.save
      @user = User.get_user(@current_user.id)
      if @user.update(is_admin: 1, company_id: @company_datum.id)
        render :json => { 
          message: "successfully created company",
          user: @user,
          company: @company_datum
        }
      else
        @company_datum.destroy
        render :json => { errors: @user.errors.full_messages },
            status: :unprocessable_entity
      end
    else
      render json: { errors: @company_datum.errors.full_messages },
               status: :unprocessable_entity
    end
  end

  def invite
    if @company_datum
      @user = User.get_user_by_username(params[:username])
      if @user.update(company_id: @company_datum.id)
        render :json => { message: "#{@user.username} successfully invited" }
      else
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    else
      render :json => { errors: "You don't have a company yet" }, status: :not_found
    end
  end

  private

  def find_company
    @company_datum = User.get_company(@current_user.company_id)
    rescue ActiveRecord::RecordNotFound
      render json: { errors: "You don't have a company yet" }, status: :not_found
  end

  def company_params
    params.permit(:name, :description, :total_employee, :email, :location, :website)
  end
end
