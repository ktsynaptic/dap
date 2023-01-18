
class FileController < ApplicationController
  before_action :authenticate_user!

  def show
    @file_id = params[:id]
    @access = AccessValidator.check_file_access(@file_id, current_user.id)
  end
end

