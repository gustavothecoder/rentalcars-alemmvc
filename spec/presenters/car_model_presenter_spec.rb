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

  describe 'photo_url' do
    context 'when the car model has a photo' do
      it 'should return the car model photo_url' do
        car_model = create(:car_model)
        photo_path = Rails.root.join('spec/fixtures/150x150.png')
        car_model.photo.attach(io: File.open(photo_path), filename: '150x150.png')
        result = CarModelPresenter.new(car_model).photo_url
        expect(result).to match(%r{\Ahttp://localhost/rails/active_storage/blobs/[\w\W]*/150x150.png\z})
      end
    end

    context 'when the car model has no photo' do
      it 'should return the default car model photo url' do
        car_model = create(:car_model)
        result = CarModelPresenter.new(car_model).photo_url
        expect(result).to eq('https://place-hold.it/100x100')
      end
    end
  end

  describe 'options_list' do
    context 'When the car has car options' do
      it 'should return a <ul> with the car options' do
        car_model = create(:car_model, car_options: 'gps, charger')
        result = CarModelPresenter.new(car_model).options_list
        expect(result).to eq('<ul><li>gps</li><li>charger</li></ul>')
      end
    end

    context 'When the car has no car options' do
      it 'should return a empty string' do
        car_model = build(:car_model, car_options: ' ')
        result = CarModelPresenter.new(car_model).options_list
        expect(result).to eq('')
      end
    end
  end
end
