require 'rails_helper'

RSpec.describe UserDataController do
    describe 'GET #show' do
        it "assigns the requested biodata for specific user" do
            user_datum = create(:user_datum)
            get :show, params: { id: user_datum }
            expect(assigns(:user_datum)).to eq user_datum
        end
    end
    describe 'POST #create' do
        context "with valid attributes" do
            it "saves the new user_datum in the database" do
                expect{
                    post :create, params: { user_datum: attributes_for(:user_datum) }
                }.to change(UserDatum, :count).by(1)
            end
        end

        context "with invalid attributes" do
            it "does not save the new food in the database" do
                expect{
                    post :create, params: { user_datum: attributes_for(:invalid_user_datum) }
                }.not_to change(UserDatum, :count)
            end
        end
    end
    describe 'PATCH #update' do
        before :each do
            @user_datum = create(:user_datum)
        end
        context "with valid attributes" do
            it "locates the requested @user_datum" do
                patch :update, params: { id: @user_datum, user_datum: attributes_for(:user_datum) }
                expect(assigns(:user_datum)).to eq @user_datum
            end
            it "changes @user_datum's attributes" do
                patch :update, params: { id: @user_datum, user_datum: attributes_for(:user_datum, name: 'Iqbal') }
                @user_datum.reload
                expect(@user_datum.name).to eq('Iqbal')
            end
        end

        context "with invalid attributes" do
            it "does not update the user_datum in the database" do
                patch :update, params: { id: @user_datum, user_datum: attributes_for(:invalid_user_datum) }
                expect(@user_datum.name).not_to eq('Iqbal')
            end
        end
    end
end