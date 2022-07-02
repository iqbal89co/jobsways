class JobApplicationsController < ApplicationController

  
  def index
    if params[:user]
      @job_applications = @job_applications.search_job_application_by_user(params[:user])
    elsif params[:job]
      @job_applications = @job_applications.search_job_application_by_job(params[:job])
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

    respond_to do |format|
      if @job_application.save
        format.html { redirect_to job_application_url(@job_application), notice: "Job application was successfully created." }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html { redirect_to job_application_url(@job_application), notice: "Job application was successfully updated." }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_application.destroy

    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: "Job application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    def job_application_params
      params.require(:job_application).permit(:user_id, :job_id, :status)
    end

    def search_job_application_by_job(id)
      @job_application = JobApplication.where(job_id: id)
    end
    def search_job_application_by_user(id)
      @job_application = JobApplication.where(user_datum_id: id)
    end
end
