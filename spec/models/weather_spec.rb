require 'rails_helper'

RSpec.describe Weather, type: :model do
  describe 'validations' do
    it 'validates presence of required field' do
      should validate_presence_of(:date)
      should validate_presence_of(:weather_index)
    end

    it 'validate realtionships' do
      should have_one(:location)
      should have_many(:temperatures)
      should accept_nested_attributes_for(:location)
    end

  end
end
