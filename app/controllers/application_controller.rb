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
    head :not_found
  end

  private

  def code_data
    { plain: params[:code] }
  end
end
