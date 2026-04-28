module YouTubeMusic
  module Search
    class Albums
      class Album < YouTubeMusic::Search::Albums
        include YouTubeMusic::Mixins::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_album_data
          ]
        end

        def data
          Muffon::Formatter::Source::Search::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: youtube_id,
            title:,
            artists:,
            image_data:,
            release_date:,
            **self_args
          )
        end

        def title
          raw_album_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            0,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            0,
            'text'
          )
        end

        def raw_album_data
          @args[:raw_album_data]
        end

        def youtube_id
          raw_album_data.dig(
            'musicResponsiveListItemRenderer',
            'navigationEndpoint',
            'browseEndpoint',
            'browseId'
          )
        end

        def raw_raw_artists
          find_raw_artists_data(
            raw_album_data.dig(
              'musicResponsiveListItemRenderer',
              'flexColumns',
              1,
              'musicResponsiveListItemFlexColumnRenderer',
              'text',
              'runs'
            )
          )
        end

        def image_url
          raw_album_data.dig(
            'musicResponsiveListItemRenderer',
            'thumbnail',
            'musicThumbnailRenderer',
            'thumbnail',
            'thumbnails',
            -1,
            'url'
          )
        end

        def raw_release_date
          raw_album_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            -1,
            'text'
          )
        end
      end
    end
  end
end
