class UploadsController < ApplicationController

  def new
  end

  def create
    @purchases = parse_file
  end

  private

  def parse_file
    TabFileParser.new.parse(params[:file]) if params[:file]
  end
end
