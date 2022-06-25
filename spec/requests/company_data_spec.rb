require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/company_data", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # CompanyDatum. As you add validations to CompanyDatum, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      CompanyDatum.create! valid_attributes
      get company_data_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      company_datum = CompanyDatum.create! valid_attributes
      get company_datum_url(company_datum)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_company_datum_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      company_datum = CompanyDatum.create! valid_attributes
      get edit_company_datum_url(company_datum)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CompanyDatum" do
        expect {
          post company_data_url, params: { company_datum: valid_attributes }
        }.to change(CompanyDatum, :count).by(1)
      end

      it "redirects to the created company_datum" do
        post company_data_url, params: { company_datum: valid_attributes }
        expect(response).to redirect_to(company_datum_url(CompanyDatum.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CompanyDatum" do
        expect {
          post company_data_url, params: { company_datum: invalid_attributes }
        }.to change(CompanyDatum, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post company_data_url, params: { company_datum: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested company_datum" do
        company_datum = CompanyDatum.create! valid_attributes
        patch company_datum_url(company_datum), params: { company_datum: new_attributes }
        company_datum.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the company_datum" do
        company_datum = CompanyDatum.create! valid_attributes
        patch company_datum_url(company_datum), params: { company_datum: new_attributes }
        company_datum.reload
        expect(response).to redirect_to(company_datum_url(company_datum))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        company_datum = CompanyDatum.create! valid_attributes
        patch company_datum_url(company_datum), params: { company_datum: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested company_datum" do
      company_datum = CompanyDatum.create! valid_attributes
      expect {
        delete company_datum_url(company_datum)
      }.to change(CompanyDatum, :count).by(-1)
    end

    it "redirects to the company_data list" do
      company_datum = CompanyDatum.create! valid_attributes
      delete company_datum_url(company_datum)
      expect(response).to redirect_to(company_data_url)
    end
  end
end
