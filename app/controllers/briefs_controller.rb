class BriefsController < ApplicationController
  before_action :set_brief, only: %i[show]
  
  def index
    @briefs = Brief.all
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_brief
    @brief = Brief.find(params[:id])
  end
end
