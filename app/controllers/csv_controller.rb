class CsvController < ApplicationController
  def import
    if params[:file].content_type != "text/csv"
      flash[:error] = "invalid file type"
      return
    end
    CsvFile.import(params[:file], current_user.id, Time.now)
    flash[:success] = "File Uploaded Successfully"
    redirect_to '/layouts/application'
  end
end
