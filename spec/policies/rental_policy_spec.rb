# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentalPolicy, type: :policy do
  let(:subsidiary) { create(:subsidiary, name: 'Almeida Motors') }
  let(:manufacture) { create(:manufacture) }
  let(:fuel_type) { create(:fuel_type) }
  let(:category) { create(:category, name: 'A', daily_rate: 50) }
  let(:customer) do
    create(:individual_client, name: 'Claudionor', cpf: '318.421.176-43', email: 'cro@email.com')
  end
  let(:car_model) do
    create(:car_model, name: 'Sedan', manufacture: manufacture, fuel_type: fuel_type, category: category)
  end
  let!(:car) { create(:car, car_model: car_model, license_plate: 'TAT-1234') }
  let!(:rental) do
    create(
      :rental, category: category, subsidiary: subsidiary, start_date: '3000-01-08', end_date: '3000-01-10',
               client: customer, price_projection: 100, status: :scheduled
    )
  end

  context 'When the user is an admin' do
    it 'should return true' do
      user = create(:user, :admin)
      result = RentalPolicy.allowed?(user, subsidiary)
      expect(result).to be(true)
    end
  end

  context 'when the user subsidiary and rental subsidiary are equal' do
    it 'should return true' do
      user = create(:user, subsidiary: subsidiary)
      result = RentalPolicy.allowed?(user, subsidiary)
      expect(result).to be(true)
    end
  end

  context 'When the user does not admin and the user subsidiary and rental subsidiary is not equal' do
    it 'should return false' do
      user = create(:user)
      result = RentalPolicy.allowed?(user, subsidiary)
      expect(result).to be(false)
    end
  end
end
