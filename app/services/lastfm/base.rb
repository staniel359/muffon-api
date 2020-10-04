module LastFM
  class Base < Muffon::Base
    private

    def lastfm_api_link
      'http://ws.audioscrobbler.com/2.0'
    end

    def lastfm_api_key
      secrets.lastfm[:api_key][Rails.env.to_sym]
    end
  end
end
