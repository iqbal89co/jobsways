class JobApplicationsController < ApplicationController

  
  def index
    @job_applications = JobApplication.all
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
end
