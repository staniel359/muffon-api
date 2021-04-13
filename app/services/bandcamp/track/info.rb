module Bandcamp
  module Track
    class Info < Bandcamp::Track::Base
      private

      def track_data
        track_base_data.merge(track_extra_data)
      end

      def track_base_data
        {
          id: track_id(artist_name(response_data), title),
          title: title,
          artist: artist_data(response_data)
        }
      end

      def track_extra_data
        {
          album: album_data,
          images: images_data(image(response_data)),
          length: length(track),
          description: description_truncated,
          tags: tags.first(5),
          audio: audio_data(track)
        }
      end

      def album_data
        return {} if response_data['album_title'].blank?

        { title: response_data['album_title'] }
      end

      def track
        tracks_list[0]
      end

      def audio_data(track)
        {
          present: audio_link(track).present?,
          link: audio_link(track),
          source: 'bandcamp'
        }
      end
    end
  end
end
