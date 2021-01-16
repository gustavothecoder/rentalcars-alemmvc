# frozen_string_literal: true

class CarModelPresenter < BasePresenter
  include Rails.application.routes.url_helpers
  delegate :content_tag, :concat, to: :helpers

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

  def options_list
    return '' if car_options.strip.empty?

    content_tag(:ul) do
      car_options.split(',').each do |option|
        concat(content_tag(:li, option.strip))
      end
    end
  end
end
