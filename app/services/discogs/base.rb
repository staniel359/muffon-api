module Discogs
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    rescue *Muffon::Errors.list => e
      Muffon::Errors.handle(e.class)
    end

    private

    def no_data?
      response_data.blank?
    end

    def response_data
      @response_data ||= JSON.parse(api_response)
    end

    def api_response
      RestClient.get(link, params: params)
    end

    def base_link
      'https://api.discogs.com'
    end

    def params
      auth_params.merge(extra_params)
    end

    def auth_params
      {
        key: secrets.discogs[:api_key],
        secret: secrets.discogs[:api_secret]
      }
    end

    def extra_params
      {}
    end

    def images
      {
        original: image,
        large: image,
        medium: image,
        small: image,
        extrasmall: image
      }
    end

    def image
      primary_image.to_h['uri'].to_s
    end

    def primary_image
      response_data['images'].to_a.find { |i| i['type'] == 'primary' }
    end

    def length_formatted(length)
      length.split(':').map(&:to_i).inject { |m, s| m * 60 + s }.to_i
    end

    def tracks_filtered
      response_data['tracklist'].select { |t| t['type_'] == 'track' }
    end

    def artist_name(artists)
      artists.map do |a|
        [a['name'], artist_join(a['join'])]
      end.flatten.join
    end

    def artist_join(join)
      return join if join == ''

      pre_space = ' ' unless join == ','

      "#{pre_space}#{join} "
    end

    def track_id(track)
      super(track_artist_name(track), track['title'])
    end

    def track_artist_name(track)
      artists = track['artists'] || response_data['artists']

      artist_name(artists)
    end

    def description
      artists_gsub = description_data.gsub(/\[a=(.*?)\]/, '\1')
      groups_gsub = artists_gsub.gsub(
        /\[m=(.*?)\]/,
        'https://www.discogs.com/master/\1'
      )
      groups_gsub.gsub(/\[.*?\]/, '')
    end

    def description_data
      response_data['notes'].to_s
    end
  end
end
