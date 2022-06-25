require 'rails_helper'

RSpec.describe Job, type: :model do
  it 'is valid job details' do
    expect(FactoryBot.build(:job)).to be_valid
  end
  context 'is invalid without' do
    it 'title' do
      job = FactoryBot.build(:job, title: nil)
      job.valid?
      expect(job.errors[:title]).to include("can't be blank")
    end
    it 'position' do
      job = FactoryBot.build(:job, position: nil)
      job.valid?
      expect(job.errors[:position]).to include("can't be blank")
    end
    it 'salary' do
      job = FactoryBot.build(:job, salary: nil)
      job.valid?
      expect(job.errors[:salary]).to include("can't be blank")
    end
    it 'location' do
      job = FactoryBot.build(:job, location: nil)
      job.valid?
      expect(job.errors[:location]).to include("can't be blank")
    end
    it 'job_type' do
      job = FactoryBot.build(:job, job_type: nil)
      job.valid?
      expect(job.errors[:job_type]).to include("can't be blank")
    end
    it 'description' do
      job = FactoryBot.build(:job, description: nil)
      job.valid?
      expect(job.errors[:description]).to include("can't be blank")
    end
  end
  context "is invalid with wrong value of" do
    it "job_type" do
      job = FactoryBot.build(:job, job_type: "asdkj")
      job.valid?
      expect(job.errors[:job_type]).to include("asdkj is not available")
    end
    it "status" do
      job = FactoryBot.build(:job, status: "jashdj")
      job.valid?
      expect(job.errors[:status]).to include("jashdj is not available")
    end
  end
end
