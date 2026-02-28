module YouTubeMusic
  module Artist
    class Albums < YouTubeMusic::Artist::Base
      ALBUMS_TYPES_DATA = {
        'album' => 'albums',
        'single_ep' => 'singles_eps'
      }.freeze

      private

      def required_args
        [
          *super,
          :albums_type
        ]
      end

      def wrong_args?
        albums_type.blank?
      end

      def albums_type
        ALBUMS_TYPES_DATA[@args[:albums_type]]
      end

      def artist_data
        {
          **super,
          **albums_data
        }
      end

      def name
        raw_artist_data.dig(
          'header',
          'musicHeaderRenderer',
          'title',
          'runs',
          0,
          'text'
        )
      end

      def albums_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def raw_collection
        raw_artist_data.dig(
          'contents',
          'singleColumnBrowseResultsRenderer',
          'tabs',
          0,
          'tabRenderer',
          'content',
          'sectionListRenderer',
          'contents',
          0,
          'gridRenderer',
          'items'
        )
      end

      def payload
        {
          'browseId' => page_data[:id],
          'params' => page_data[:param],
          'context' => payload_context_data
        }.to_json
      end

      def page_data
        artist_info_data.dig(
          :pages,
          albums_type.to_sym
        )
      end

      def artist_info_data
        @artist_info_data ||=
          YouTubeMusic::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        YouTubeMusic::Artist::Albums::Album.call(
          raw_album_data:,
          artist_info_data:,
          **self_args
        )
      end
    end
  end
end
