# frozen_string_literal: true

class CarModelPresenter < BasePresenter
  def initialize(car_model)
    super(car_model)
  end

  def manufacture_name
    return manufacture.name if manufacture.present?

    'N/A'
  end
end
