class ApplicationController < ActionController::API
  private

  def render_data_with_status(method)
    data_json = send(method)
    status_code = data_json.dig(:error, :code) || 200
    render(
      json: data_json,
      status: status_code
    )
  end
end
