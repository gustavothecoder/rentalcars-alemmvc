# frozen_string_literal: true

module RentalsHelper
  RENTAL_STATUS = {
    'scheduled' => 'badge-success',
    'in_review' => 'badge-info',
    'ongoing' => 'badge-primary',
    'finalized' => 'badge-secondary'
  }.freeze

  def status_label(rental)
    content_tag(:span, t(rental.status).capitalize, class: "badge #{RENTAL_STATUS[rental.status]}")
  end
end
