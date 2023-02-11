module EventableVideo
  extend ActiveSupport::Concern

  include Eventable

  private

  def eventable_data
    { video: video_data }
  end

  def video_data
    {
      youtube_id:
        video.youtube_id,
      title: video.title
    }
  end
end
