class ApplicationController < ActionController::API
  def not_found
    render json: not_found_handler, status: 404
  end

  private

  def not_found_handler
    Muffon::Errors.handlers.not_found
  end
end
