module Bandcamp
  module Album
    class Info < Bandcamp::Album::Base
      def call
        super { return handle_no_tracks if no_tracks? }
      end

      private

      def no_tracks?
        tracks_data.blank?
      end

      def handle_no_tracks
        return redirect if redirect_link.present?

        handlers.not_found
      end

      def redirect_link
        description[bandcamp_link_regexp]
      end

      def redirect
        self.class.name.constantize.call(link: redirect_link)
      end

      def data
        { album: album_data }
      end

      def album_data
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          title: track_title,
          artist: artist_name,
          source: 'bandcamp'
        }
      end

      def album_extra_data
        {
          images: images,
          released: released,
          link: base_data['@id'],
          description: description_truncated,
          tags: tags.first(5),
          tracks: tracks
        }
      end

      def released
        time_formatted(base_data['datePublished'])
      end

      def tracks
        tracks_data.map do |t|
          {
            id: track_id(artist_name, t['title']),
            title: t['title'],
            length: t['duration'].floor,
            link: track_link(t),
            audio: audio_data(t)
          }
        end
      end

      def track_link(track)
        base_data.dig('byArtist', '@id') + track['title_link']
      end

      def audio_data(track)
        {
          present: track['file'].present?,
          source: 'bandcamp'
        }
      end
    end
  end
end
