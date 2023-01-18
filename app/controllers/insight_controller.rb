# frozen_string_literal: true

class InsightController < ApplicationController
  before_action :authenticate_user!

  def index
    @rows = InsightGenerator.all_rows(current_user.id)
  end

  def send_mail
    ResultMailer.with(user_id: current_user.id, email_to: params[:email_to]).send_result_email.deliver_now
  end
end
