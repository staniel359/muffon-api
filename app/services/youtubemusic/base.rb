module YouTubeMusic
  class Base < Muffon::Base
    SOURCE_NAME = 'youtubemusic'.freeze
    BASE_LINK =
      'https://music.youtube.com/youtubei/v1/search'.freeze
    VERSION_PARAM = '1.20230227.01.00'.freeze

    private

    def context_data
      { client: client_data }
    end

    def client_data
      {
        'clientName' => 'WEB_REMIX',
        'clientVersion' => VERSION_PARAM,
        'gl' => 'GB'
      }
    end

    def image_data_formatted(
      image
    )
      YouTubeMusic::Utils::Image.call(
        image:
      )
    end

    def artist_data_formatted(
      raw_artist_data
    )
      {
        source: artist_source_data(
          raw_artist_data
        ),
        name: raw_artist_data['text']
      }
    end

    def artist_source_data(
      raw_artist_data
    )
      {
        name: source_name,
        id: artist_youtube_id(
          raw_artist_data
        )
      }
    end

    def artist_youtube_id(
      raw_artist_data
    )
      raw_artist_data.dig(
        'navigationEndpoint',
        'browseEndpoint',
        'browseId'
      )
    end

    def find_raw_views_count(
      raw_collection
    )
      raw_collection
        .find do |raw_item_data|
          raw_item_data['text'].match?(
            /(.+) views/
          )
        end
        .try(:[], 'text')
        &.match(/(.+) views/)
        .try(:[], 1)
    end

    def find_raw_plays_count(
      raw_collection
    )
      raw_collection
        .find do |raw_item_data|
          raw_item_data['text'].match?(
            /(.+) plays/
          )
        end
        .try(:[], 'text')
        &.match(/(.+) plays/)
        .try(:[], 1)
    end

    def find_raw_duration(
      raw_collection
    )
      raw_collection
        .find do |raw_item_data|
          raw_item_data['text'].match?(
            /\d+:\d+/
          )
        end
        .try(:[], 'text')
    end

    def find_raw_videos_count(
      raw_collection
    )
      raw_collection
        .find do |raw_item_data|
          raw_item_data['text'].match?(
            /(.+) songs/
          )
        end
        .try(:[], 'text')
        &.match(/(.+) songs/)
        .try(:[], 1)
    end

    def find_raw_artists_data(
      raw_collection
    )
      raw_collection.select do |raw_item_data|
        type =
          raw_item_data.dig(
            'navigationEndpoint',
            'browseEndpoint',
            'browseEndpointContextSupportedConfigs',
            'browseEndpointContextMusicConfig',
            'pageType'
          )

        type == 'MUSIC_PAGE_TYPE_ARTIST'
      end
    end

    def find_raw_album_data(
      raw_collection
    )
      raw_collection.find do |raw_item_data|
        type =
          raw_item_data.dig(
            'navigationEndpoint',
            'browseEndpoint',
            'browseEndpointContextSupportedConfigs',
            'browseEndpointContextMusicConfig',
            'pageType'
          )

        type == 'MUSIC_PAGE_TYPE_ALBUM'
      end
    end

    def find_youtube_id(
      raw_collection
    )
      raw_collection
        .find do |raw_item_data|
          raw_item_data['key'] == 'browse_id'
        end
        .try(:[], 'value')
    end

    alias artist_name artists_names
  end
end
