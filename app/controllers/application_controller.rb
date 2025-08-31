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
    save_invalid_request if production?

    head :not_found
  end

  private

  def development?
    Rails
      .env
      .development?
  end

  def test?
    Rails
      .env
      .test?
  end

  def production?
    Rails
      .env
      .production?
  end

  def code_data
    { plain: params[:code] }
  end

  def save_invalid_request
    Muffon::Utils::InvalidRequestSaver.call(
      request:
    )
  end
end
