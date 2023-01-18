class ResultMailer < ApplicationMailer
  default from: 'kishan.tripathi@synaptic.com'

  def send_result_email
    @user_id = params[:user_id]
    @max = InsightGenerator.get_max(@user_id)
    @median = InsightGenerator.get_median(@user_id)

    mail(to: params[:email_to], subject: 'Data Analytics Result')
  end
end
