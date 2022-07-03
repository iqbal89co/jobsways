class JobsController < ApplicationController
  before_action :authorize_request
  def index
    @jobs = Job.get_all_jobs
    if params[:s]
      @jobs = @jobs.search_job(params[:s])
    elsif params[:job_type]
      @jobs = @jobs.filter_by_type(params[:job_type])
    end
    render :json => @jobs
  end

  def show
    @job = Job.get_job(params[:id])
    render :json => @job
  end

  def create
    @job = Job.new(job_params.merge(:company_datum_id => @current_user.company_id))
    if @job.save
      render json: { status: :success }
    else
      render json: { status: :unprocessable_entity, msg: @job.errors }
    end
  end

  def update
    @job = Job.get_job(params[:id])
    if @current_user.company_id == @job.company_datum_id
      @job.update(job_params)
      render :json => { msg: "success" }
    else
      render :json => {
        errors: "you don't have permissions to do that"
      }
    end
  end

  def destroy
    @job = Job.get_job(params[:id])
    if @current_user.company_id == @job.company_datum_id
      @job.destroy
      render :json => { msg: "success" }
    else
      render :json => {
        errors: "you don't have permissions to do that"
      }
    end
  end

  private

  def job_params
    params.permit(:company_datum_id, :title, :position, :salary, :salary_upto, :location, :job_type, :description, :status)
  end
end
