class StaticPagesController < ApplicationController
  before_action :logged_in_customer, only: [:calendar, :weather, :reservation]

  def home
  end

  def calendar
  end

  def weather
  end

  def reservation
  end
end
