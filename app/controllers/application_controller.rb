class ApplicationController < ActionController::API
  def no_content
    head :no_content
  end

  def not_found
    head :not_found
  end
end
