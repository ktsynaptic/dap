# frozen_string_literal: true

class FileController < ApplicationController
  before_action :authenticate_user!

  def show
    @file = CsvFile.find_by(id: params[:id])
  end
end

