# frozen_string_literal: true

class CarModelPresenter < BasePresenter
  include Rails.application.routes.url_helpers

  def initialize(car_model)
    super(car_model)
  end

  def manufacture_name
    return manufacture.name if manufacture.present?

    'N/A'
  end

  def photo_url
    return rails_blob_url(photo) if photo.attached?

    'https://place-hold.it/100x100'
  end
end
