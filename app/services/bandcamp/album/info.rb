module Bandcamp
  module Album
    class Info < Bandcamp::Album::Base
      private

      def album_data
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          id: album_id(artist_name(response_data), title),
          title: title,
          artist: artist_data(response_data),
          source: 'bandcamp'
        }
      end

      def album_extra_data
        {
          image: image_data(image(response_data)),
          released: released,
          description: description_truncated,
          tags: tags.first(5),
          tracks: tracks_data
        }
      end

      def released
        time_formatted(
          Time.zone.at(
            response_data['release_date']
          ).to_s
        )
      end

      def tracks_data
        tracks_list.map { |t| track_data(t) }
      end

      def track_data(track)
        {
          id: track_id(track['band_name'], track['title']),
          title: track['title'],
          artist: artist_data(track),
          length: length(track),
          audio: audio_data(track)
        }
      end

      def audio_data(track)
        {
          present: audio_link(track).present?,
          id: track['track_id'],
          artist_id: track['band_id'],
          source: 'bandcamp'
        }
      end
    end
  end
end
