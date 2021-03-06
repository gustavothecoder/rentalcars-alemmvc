# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentalPresenter, type: :presenter do
  describe 'status_label' do
    context 'When the status is scheduled' do
      it 'Should return Agendada tag with the badge and badge-success classes' do
        rental = build(:rental, status: :scheduled)
        result = RentalPresenter.new(rental).status_label
        expect(result).to eq('<span class="badge badge-success">Agendada</span>')
      end
    end

    context 'When the status is in_review' do
      it 'Should return Em revisão tag with the badge and badge-info classes' do
        rental = build(:rental, status: :in_review)
        result = RentalPresenter.new(rental).status_label
        expect(result).to eq('<span class="badge badge-info">Em revisão</span>')
      end
    end

    context 'When the status is ongoing' do
      it 'Should return Em andamento tag with the badge and badge-primary classes' do
        rental = build(:rental, status: :ongoing)
        result = RentalPresenter.new(rental).status_label
        expect(result).to eq('<span class="badge badge-primary">Em andamento</span>')
      end
    end

    context 'When the status is finalized' do
      it 'Should return Finalizada tag with the badge and badge-secondary classes' do
        rental = build(:rental, status: :finalized)
        result = RentalPresenter.new(rental).status_label
        expect(result).to eq('<span class="badge badge-secondary">Finalizada</span>')
      end
    end
  end
end
