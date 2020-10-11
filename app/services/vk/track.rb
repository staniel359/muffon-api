module VK
  class Track < VK::Base
    private

    def primary_args
      [@args.query]
    end

    def no_data?
      search_data.blank?
    end

    def search_data
      @search_data ||= VK::Search::Tracks.call(
        query: @args.query
      )[:search]
    end

    def data
      { track: track_data }
    end

    def track_data
      VK::Audio.call(ids: [track_id])[:tracks]
    end

    def track_id
      search_data.dig(:tracks, position, :audio_id)
    end

    def position
      @args.position || 0
    end
  end
end
