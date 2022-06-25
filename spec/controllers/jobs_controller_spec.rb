require 'rails_helper'

RSpec.describe JobsController do
    describe 'GET #index' do
        context 'with params[:s]' do
            it "populates an array of jobs containing the search params" do
                job1 = create(:job, title: 'Programmer Python')
                job2 = create(:job, title: 'Designer UI/UX')
                get :index, params: { s: 'Designer' }
                expect(assigns(:jobs)).to match_array([job2])
            end
        end

        context 'without params[:s]' do
            it "populates an array of all jobs" do
                job1 = create(:job, title: 'Programmer Python')
                job2 = create(:job, title: 'Designer UI/UX')
                get :index
                expect(assigns(:jobs)).to match_array([job1, job2])
            end
        end
    end
    describe 'GET #show' do
        it "assigns the requested job to @job" do
            job = create(:job)
            get :show, params: { id: job }
            expect(assigns(:job)).to eq job
        end
    end
    describe 'POST #create' do
        context "with valid attributes" do
            it "saves the new job in the database" do
                expect{
                post :create, params: { job: attributes_for(:job) }
                }.to change(Job, :count).by(1)
            end
        end
    end
    describe 'PATCH #update' do
        before :each do
            @job = create(:job)
        end
        context "with valid attributes" do
            it "locates the requested @job" do
                patch :update, params: { id: @job, job: attributes_for(:job) }
                expect(assigns(:job)).to eq @job
            end

            it "changes @job's attributes" do
                patch :update, params: { id: @job, job: attributes_for(:job, title: 'Programmer Mobile') }
                @job.reload
                expect(@job.title).to eq('Programmer Mobile')
            end
        end
    end
    describe 'DELETE #destroy' do
        before :each do
            @job = create(:job)
        end
        it "deletes the job from the database" do
            expect{
                delete :destroy, params: { id: @job }
            }.to change(Job, :count).by(-1)
        end
    end
end