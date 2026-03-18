module YouTubeMusic
  class Base < Muffon::Base
    SOURCE_NAME = 'youtubemusic'.freeze
    BASE_LINK =
      'https://music.youtube.com/youtubei/v1/search'.freeze

    include YouTube::Utils::Base

    private

    # rubocop:disable Layout/LineLength
    def headers
      {
        **super,
        'X-Goog-Visitor-Id' =>
          'CgtoTGtFbEc5UEYtZyihh9XNBjIKCgJHQhIEGgAgaGLfAgrcAjE2LllUPU5QUFp4dU91N28tQWQxMk5Vdl9rTl9fLW5WVEZBS3BnSS0xb1p6YUpZSlpGaGlidnprY3RvUVptZUtZeFFGUE84a2pVX0dLUjAwaVZXemJab19tZlppeS11U2lpQUpzY3IyT1plSkNqOGpzbjcwOW94NDY3VlFzZ281VnFLcS1YOS12aERNR2syWF80cTlpREU5T3VEbWtqNlllemJ0X2paaktxbFgzRW1QTF9SekN3aFFuc2Y1OFZYVU5HQi1FMHYzeVZsdW9Wb1BiVTRTTUxWd1JLZXhRcENydnlUVlExaUl3WUZuOWJmVDljQ0R3cE1zdEFFdGliRUdFWTJKNFpMVVlqV2dyT1VrMWRRRS1oZ1RLdC1QMkM2VW5RZWtvY0kwSWZNMUNIMEZoSkRWbk10UmhibEowN3JJQnJQMWl5M1BIUGpkUmxmUTBOWHVFb2VUaW4ydw%3D%3D',
        'X-Youtube-Bootstrap-Logged-In' => 'false',
        'X-Youtube-Client-Name' => '67',
        'X-Youtube-Client-Version' => '1.20260311.03.00',
        'Referer' => 'https://music.youtube.com',
        'DNT' => '1'
      }
    end

    def cookies
      {
        '__Secure-ROLLOUT_TOKEN' => 'CNGmmZiBwa2IkwEQsPS9-aGfkwMYhYDS_aGfkwM=',
        '__Secure-YNID' => '16.YT=W3P7dRt2_-T1FRjJFkYP3lXqi77dPYPo0KNpuacliJWxY3Iv-fN9wLYXHkNsT3Wx_vOA5h_GsL-nczN5RfFUages7VV8l36oXmHAETJPob5vtuoLKhmavneoE8c195kDozCOihc6zYNEklhyMi9RQilc9FC0Y3OGfSqL7VRNpZY3EBHb1poruRSHNIdCT6WwdiN0QmyX59Rstu5M-KUK2AOMDNdpHtnhUVbb4CUGJIavGwbT9WrmXmt4jcPDnfSMwryiFun5yNM8eYeqs1icrBZhw16UmKTYEJd_hO7lKbbVnh22Wu70bm5ItSeVYmpEUQyQw4onWovDwFaNn8HNnQ',
        '_gcl_au' => '1.1.1024733403.1773486950',
        'SOCS' => 'CAISNQgREitib3FfaWRlbnRpdHlmcm9udGVuZHVpc2VydmVyXzIwMjYwMzExLjA2X3AwGgJlbiACGgYIgMrSzQY',
        'VISITOR_INFO1_LIVE' => 'hLkElG9PF-g',
        'VISITOR_PRIVACY_METADATA' => 'CgJHQhIEGgAgaA==',
        'YSC' => '_zMhf_yedNc'
      }
    end
    # rubocop:enable Layout/LineLength

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
