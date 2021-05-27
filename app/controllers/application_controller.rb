class ApplicationController < ActionController::API
  def not_found
    render(
      {
        json: not_found_handler,
        status: :not_found
      }
    )
  end

  private

  def not_found_handler
    Muffon::Utils::Errors.handlers[:not_found]
  end
end
