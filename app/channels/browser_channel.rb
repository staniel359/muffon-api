class BrowserChannel < ApplicationCable::Channel
  def subscribed; end

  def unsubscribed; end

  def update(data)
    route = data.dig(
      'payload', 'route'
    )

    create_profile_browser_event(
      route
    )
  end

  private

  def create_profile_browser_event(route)
    return if profile.blank?

    profile
      .browser_events
      .create!(
        data: route
      )
  end
end
