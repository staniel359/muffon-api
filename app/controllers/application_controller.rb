class ApplicationController < ActionController::API
  def code
    render(
      code_data
    )
  end

  def no_content
    head :no_content
  end

  def not_found
    save_invalid_request

    head :not_found
  end

  private

  def code_data
    { plain: params[:code] }
  end

  def save_invalid_request
    return unless Rails.env.production?

    Utils::InvalidRequestSaver.call(
      request:
    )
  end
end
