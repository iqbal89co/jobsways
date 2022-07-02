class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: %i[ show edit update destroy ]
  before_action :authorize_request, except: :create
  before_action :find_user_datum, only: %i[ index ]

  def index
    if params[:filter] == "user"
      @job_applications = JobApplication.where(user_datum_id: @user_datum.id)
    elsif params[:filter] == "job" && params[:id]
      @job_applications = JobApplication.where(job_id: params[:id])
    else
      @job_applications = JobApplication.all
    end
    render :json => @job_applications
  end

  def show
    render :json => @job_application
  end

  def new
    @job_application = JobApplication.new
  end

  def edit
  end


  def create
    @job_application = JobApplication.new(job_application_params)

      if @job_application.save
        render json: { status: :success }
      else
        render json: { status: :unprocessable_entity, msg: @job_application.errors }
      end
  end

  def update
      if @job_application.update(job_application_params)
        render json: { status: :success }
      else
        render json: { status: :unprocessable_entity, msg: @job_application.errors }
      end
  end

  def destroy
    @job_application.destroy
    render json: { status: :success }
  end

  private
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    def job_application_params
      params.permit(:user_datum_id, :job_id, :status)
    end

    def find_user_datum
      @user_datum = UserDatum.get_user_datum(@current_user.id)
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end
end
