class JobsController < ApplicationController
  def index
    @jobs = Job.get_all_jobs
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

  def delete
  end

  private
  def job_params
    params.require(:job).permit(:title, :position, :salary, :salary_upto, :location, :job_type, :description, :status)
  end
end
