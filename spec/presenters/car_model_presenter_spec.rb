# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarModelPresenter, type: :presenter do
  describe 'manufacture_name' do
    context 'When the manufacture exists' do
      it 'should return the manufacture name' do
        manufacture = build(:manufacture)
        car_model = build(:car_model, manufacture: manufacture)
        result = CarModelPresenter.new(car_model).manufacture_name
        expect(result).to eq(manufacture.name)
      end
    end

    context 'When the manufacture exists' do
      it 'should return N/A' do
        car_model = build(:car_model, manufacture: nil)
        result = CarModelPresenter.new(car_model).manufacture_name
        expect(result).to eq('N/A')
      end
    end
  end
end
