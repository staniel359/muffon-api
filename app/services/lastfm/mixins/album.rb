module LastFM
  module Mixins
    module Album
      include Muffon::Mixins::Album
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_album_data['name']
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        {
          name: artist_name,
          source: source_name
        }
      end

      def artist_name
        raw_album_data['artist']
      end

      def source_original_link
        "https://www.last.fm/music/#{CGI.escape(artist_name)}/#{CGI.escape(title)}"
      end

      def image_url
        raw_album_data.dig(
          'image',
          -1,
          '#text'
        )
      end

      def image_data
        album_record.image_data
      end

      def listeners_count
        return if raw_listeners_count.blank?

        raw_listeners_count.to_i
      end

      def raw_listeners_count
        raw_album_data['listeners']
      end

      def plays_count
        return if raw_plays_count.blank?

        raw_plays_count.to_i
      end

      def raw_plays_count
        raw_album_data['playcount']
      end

      def description
        LastFM::Formatter::Description.call(
          description: raw_description
        )
      end

      def raw_description
        raw_album_data.dig(
          'wiki',
          'content'
        )
      end

      def raw_tags
        if raw_album_data['tags'].present?
          tags = raw_album_data.dig('tags', 'tag')

          case tags
          when Array
            tags
          when Hash
            [tags]
          else
            raise tags
          end
        else
          []
        end
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['name']
      end

      def raw_tracks
        if raw_album_data['tracks'].present?
          tracks = raw_album_data.dig('tracks', 'track')

          case tracks
          when Array
            tracks
          when Hash
            [tracks]
          end
        else
          []
        end
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def update_album_record!
        album_record.update!(
          album_record_attributes
        )
      end

      def album_record_attributes
        {
          image_url:,
          listeners_count:
        }.compact
      end
    end
  end
end
