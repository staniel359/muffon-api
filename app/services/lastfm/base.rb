module LastFM
  class Base < Muffon::Base
    BASE_LINK = 'https://ws.audioscrobbler.com/2.0'.freeze
    SOURCE_ID = 'lastfm'.freeze

    private

    def link
      BASE_LINK
    end

    def params
      {
        method: api_method,
        api_key:,
        format: 'json',
        autocorrect: 0
      }
    end

    def api_method
      self.class::API_METHOD
    end

    def api_key
      secrets.lastfm[:api_key]
    end

    def api_secret
      secrets.lastfm[:api_secret]
    end

    def artist_params
      { artist: artist_name_formatted }
    end

    def artist_name_formatted
      param_formatted(
        @args[:artist]
      )
    end

    def param_formatted(data)
      data.strip
    end

    def album_params
      {
        album: param_formatted(
          @args[:album]
        )
      }.merge(artist_params)
    end

    def track_params
      {
        track: param_formatted(
          @args[:track]
        )
      }.merge(artist_params)
    end

    def tag_params
      {
        tag: param_formatted(
          @args[:tag]
        )
      }
    end

    def lang_params
      { lang: @args[:lang] }.compact
    end

    def artists
      [artist_data]
    end

    def artist_data
      { name: artist_name }
    end

    def image_data_formatted(image, model)
      LastFM::Utils::Image.call(
        image:, model:
      )
    end

    def with_more_tags?
      tags_list.size >= 5
    end

    def description_formatted(data)
      return '' if data.blank?

      data.match(
        %r{(.+)<a href="http(s?)://www.last.fm}m
      )[1].strip
    end
  end
end
