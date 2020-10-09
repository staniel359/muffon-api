module VK
  class Track < VK::Base
    private

    def primary_args
      [@args.query]
    end

    def no_data?
      tracks[:search].blank?
    end

    def tracks
      @tracks ||= VK::Search::Tracks.call(query: @args.query)
    end

    def data
      VK::Audio.call(ids: [track_id])
    end

    def track_id
      tracks.dig(:search, :tracks, position, :audio_id)
    end

    def position
      @args.position || 0
    end
  end
end
