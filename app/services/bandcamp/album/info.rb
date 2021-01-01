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

      def tracks_data
        @tracks_data ||= JSON.parse(
          album_scripts[3]['data-tralbum']
        )['trackinfo']
      end

      def handle_no_tracks
        return redirect if redirect_link.present?

        handlers.not_found
      end

      def redirect_link
        info_data['description'].to_s[bandcamp_link_regexp]
      end

      def redirect
        self.class.name.constantize.call(album_link: redirect_link)
      end

      def data
        { album: album_data }
      end

      def album_data
        {
          title: info_data['name'],
          artist: artist_name,
          images: images,
          released: time_formatted(info_data['datePublished']),
          bandcamp_link: info_data['@id'],
          description: info_data['description'].to_s,
          tags: info_data['keywords'].split(', ').first(5),
          tracks: tracks
        }
      end

      def artist_name
        info_data.dig('byArtist', 'name')
      end

      def images
        {
          original: info_data['image'],
          large: info_data['image'].sub('_10', '_5'),
          medium: info_data['image'].sub('_10', '_4'),
          small: info_data['image'].sub('_10', '_3')
        }
      end

      def tracks
        tracks_data.map do |t|
          {
            id: track_id(artist_name, title(t)),
            title: title(t),
            length: t['duration'].floor,
            has_audio: t['file'].present?,
            bandcamp_link: artist_link + t['title_link']
          }
        end
      end

      def title(track)
        track['title']
      end

      def artist_link
        info_data.dig('byArtist', '@id')
      end
    end
  end
end
