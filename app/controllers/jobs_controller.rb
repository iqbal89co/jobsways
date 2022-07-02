class JobsController < ApplicationController
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
    @job = Job.new(job_params)
    @job.save
  end

  def update
    @job = Job.get_job(params[:id])
    @job.update(job_params)
  end

  def destroy
    @job = Job.get_job(params[:id])
    @job.destroy
  end

  private
  def job_params
    params.permit(:title, :position, :salary, :salary_upto, :location, :job_type, :description, :status)
  end
end
