module YouTubeMusic
  module Search
    class Artists
      class Artist < YouTubeMusic::Base
        include YouTubeMusic::Mixins::Artist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_artist_data
          ]
        end

        def data
          Muffon::Formatter::Source::Search::Artists::Artist.call(
            source_original_link:,
            source_name:,
            source_artist_id: youtube_id,
            name:,
            image_data:,
            **self_args
          )
        end

        def youtube_id
          raw_artist_data.dig(
            'musicResponsiveListItemRenderer',
            'navigationEndpoint',
            'browseEndpoint',
            'browseId'
          )
        end

        def raw_artist_data
          @args[:raw_artist_data]
        end

        def name
          raw_artist_data.dig(
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
      end
    end
  end
end
