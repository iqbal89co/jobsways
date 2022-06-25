class CompanyDataController < ApplicationController
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

  def create
    @company_datum = CompanyDatum.new(company_datum_params)

    respond_to do |format|
      if @company_datum.save
        format.html { redirect_to company_datum_url(@company_datum), notice: "Company datum was successfully created." }
        format.json { render :show, status: :created, location: @company_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company_datum.update(company_datum_params)
        format.html { redirect_to company_datum_url(@company_datum), notice: "Company datum was successfully updated." }
        format.json { render :show, status: :ok, location: @company_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company_datum.destroy

    respond_to do |format|
      format.html { redirect_to company_data_url, notice: "Company datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
     def set_company_datum
      @company_datum = CompanyDatum.find(params[:id])
    end

    def company_datum_params
      params.require(:company_datum).permit(:name, :desc, :location, :email, :website)
    end
end
