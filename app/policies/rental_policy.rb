# frozen_string_literal: true

class RentalPolicy
  def initialize(user, rental_subsidiary)
    @user = user
    @rental_subsidiary = rental_subsidiary
  end

  def self.allowed?(user, rental_subsidiary)
    new(user, rental_subsidiary).allowed?
  end

  def allowed?
    @user.admin? || @rental_subsidiary == @user.subsidiary
  end
end
