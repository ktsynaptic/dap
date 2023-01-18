# frozen_string_literal: true

class InsightController < ApplicationController
  before_action :authenticate_user!

  def index
    @rows = InsightGenerator.all_rows(current_user.id)
  end
end
