module YouTubeMusic
  module Artist
    class Info < YouTubeMusic::Artist::Base
      SCOPES_DATA = {
        'albums' => 'Albums',
        'singles_eps' => 'Singles & EPs'
      }.freeze

      include YouTubeMusic::Mixins::Artist

      private

      def request_payload
        {
          'browseId' => @args[:artist_id],
          'context' => payload_context_data
        }.to_json
      end

      def artist_data
        Muffon::Formatter::Source::Artist::Info.call(
          source_original_link:,
          source_name:,
          source_artist_id: youtube_id,
          name:,
          image_data: nil,
          description: nil,
          tags: nil,
          tags_size: nil,
          recommendation_data: nil,
          plays_count: nil,
          pages_data:
        )
      end

      def pages_data
        {
          albums: albums_page_data,
          singles_eps: singles_eps_page_data
        }
      end

      def albums_page_data
        {
          id: albums_page_id,
          param: albums_page_param
        }
      end

      def albums_page_id
        page_data(scope: 'albums')['browseId']
      end

      def page_data(
        scope:
      )
        raw_artist_data.dig(
          'contents',
          'singleColumnBrowseResultsRenderer',
          'tabs',
          0,
          'tabRenderer',
          'content',
          'sectionListRenderer',
          'contents'
        ).find do |data|
          data.dig(
            'musicCarouselShelfRenderer',
            'header',
            'musicCarouselShelfBasicHeaderRenderer',
            'title',
            'runs',
            0,
            'text'
          ) == SCOPES_DATA[scope]
        end.dig(
          'musicCarouselShelfRenderer',
          'header',
          'musicCarouselShelfBasicHeaderRenderer',
          'title',
          'runs',
          0,
          'navigationEndpoint',
          'browseEndpoint'
        )
      end

      def albums_page_param
        page_data(scope: 'albums')['params']
      end

      def singles_eps_page_data
        {
          id: singles_eps_page_id,
          param: singles_eps_page_param
        }
      end

      def singles_eps_page_id
        page_data(scope: 'singles_eps')['browseId']
      end

      def singles_eps_page_param
        page_data(scope: 'singles_eps')['params']
      end
    end
  end
end
