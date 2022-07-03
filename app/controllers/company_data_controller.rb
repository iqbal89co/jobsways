class CompanyDataController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_company_datum, only: %i[ show edit update destroy ]

  def index
    @company_data = CompanyDatum.all
    render :json => @company_data
  end

  def show
    render :json => @company_datum
  end

  def new
    @company_datum = CompanyDatum.new
  end

  def edit
  end

  def update
    if @company_datum.update(company_datum_params)
      render json: { status: :success }
    else
      render json: { status: :unprocessable_entity, msg: @company_datum.errors }
    end
  end

  def destroy
    @company_datum.destroy
    render json: { status: :success }
  end

  private
     def set_company_datum
      @company_datum = CompanyDatum.find(@current_user.company_id)
    end

    def company_datum_params
      params.permit(:name, :description, :total_employee, :email, :location, :website)
    end
end
