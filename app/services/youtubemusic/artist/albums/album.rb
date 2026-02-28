module YouTubeMusic
  module Artist
    class Albums
      class Album < YouTubeMusic::Artist::Base
        include YouTubeMusic::Mixins::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_album_data
            artist_info_data
          ]
        end

        def data
          Muffon::Formatter::Source::Artist::Albums::Album.call(
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

        def raw_album_data
          @args[:raw_album_data]
        end

        def youtube_id
          raw_album_data.dig(
            'musicTwoRowItemRenderer',
            'navigationEndpoint',
            'browseEndpoint',
            'browseId'
          )
        end

        def title
          raw_album_data.dig(
            'musicTwoRowItemRenderer',
            'title',
            'runs',
            0,
            'text'
          )
        end

        def artists
          [artist_data]
        end

        def artist_data
          @args[:artist_info_data].slice(
            :name,
            :source
          )
        end

        def image_url
          raw_album_data.dig(
            'musicTwoRowItemRenderer',
            'thumbnailRenderer',
            'musicThumbnailRenderer',
            'thumbnail',
            'thumbnails',
            0,
            'url'
          )
        end

        def raw_release_date
          raw_album_data.dig(
            'musicTwoRowItemRenderer',
            'subtitle',
            'runs',
            -1,
            'text'
          )
        end
      end
    end
  end
end
