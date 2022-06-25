require 'rails_helper'

RSpec.describe UserDatum, type: :model do
  it 'is valid user biodata' do
    expect(FactoryBot.build(:user_datum)).to be_valid
  end

  it 'is invalid without a name' do
    userData = FactoryBot.build(:user_datum, name: nil)

    userData.valid?

    expect(userData.errors[:name]).to include("can't be blank")
  end
end
