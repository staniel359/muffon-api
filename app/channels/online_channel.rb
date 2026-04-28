class OnlineChannel < ApplicationCable::Channel
  def subscribed
    update_profile_online(
      true
    )
  end

  def unsubscribed
    update_profile_online(
      false
    )
  end

  private

  def update_profile_online(
    value
  )
    Muffon::Processor::Profile::Online::Updater.call(
      profile_id:,
      token:,
      is_online: value
    )
  end
end
