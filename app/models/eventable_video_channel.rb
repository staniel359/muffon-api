module EventableVideoChannel
  extend ActiveSupport::Concern

  include Eventable

  private

  def eventable_data
    { video_channel:
        video_channel_data }
  end

  def video_channel_data
    {
      youtube_id:
        video_channel.youtube_id,
      title:
        video_channel.title
    }
  end
end
