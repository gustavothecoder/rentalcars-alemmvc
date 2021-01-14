# frozen_string_literal: true

class RentalPresenter < BasePresenter
  def initialize(rental)
    super(rental)
  end

  RENTAL_STATUS = {
    'scheduled' => 'badge-success',
    'in_review' => 'badge-info',
    'ongoing' => 'badge-primary',
    'finalized' => 'badge-secondary'
  }.freeze

  def status_label
    helpers.content_tag(:span, I18n.t(status).capitalize, class: "badge #{RENTAL_STATUS[status]}")
  end
end
