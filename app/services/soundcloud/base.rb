module SoundCloud
  class Base < Muffon::Base
    SOURCE_NAME = 'soundcloud'.freeze
    BASE_LINK =
      'https://api-v2.soundcloud.com'.freeze

    private

    def client_id
      return test_client_id if test?

      @client_id ||=
        get_global_value(
          'soundcloud:client_id',
          refresh_class_name:
            'SoundCloud::Utils::ClientId',
          is_refresh: refresh_client_id?
        )
    end

    def test_client_id
      credentials.dig(
        :soundcloud,
        :test_client_id
      )
    end

    def refresh_client_id?
      !!@args[:is_refresh_client_id]
    end

    def retry_with_new_client_id
      self.class.call(
        **@args,
        is_refresh_client_id: true
      )
    end

    def params
      { client_id: }
    end

    def proxy
      proxies[:us]
    end

    def raw_artists
      [artist]
    end

    def artist_data_formatted(
      raw_artist_data
    )
      {
        source: artist_source_data(
          raw_artist_data
        ),
        name: raw_artist_data['username']
      }
    end

    def artist_source_data(
      raw_artist_data
    )
      {
        name: source_name,
        id: raw_artist_data['id']
      }
    end

    def image_data_formatted(image)
      SoundCloud::Utils::Image.call(
        image:
      )
    end

    def tag_name_formatted(
      tag_data
    )
      tag_data
    end
  end
end
