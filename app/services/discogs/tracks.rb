module Discogs
  class Tracks < Discogs::Base
    def call
      tracks_data
    end

    private

    def tracks_data
      tracks_filtered.map { |t| track_data(t) }
    end

    def tracks_filtered
      @args.tracks.select { |t| t['type_'] == 'track' }
    end

    def track_data(track)
      {
        title: track['title'],
        length: length_formatted(track['duration'])
      }
    end

    def length_formatted(length)
      length.split(':').map(&:to_i).inject { |a, b| a * 60 + b } || 0
    end
  end
end
