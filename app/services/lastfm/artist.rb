module LastFM
  class Artist < LastFM::Base
    def call
      return error_data if parsed_response.blank?

      { artist: artist_data }
    end

    private

    def parsed_response
      @parsed_response ||= JSON.parse(response)['artist']
    end

    def response
      RestClient.get(lastfm_api_link, params: lastfm_params)
    end

    def lastfm_params
      {
        method: 'artist.getinfo',
        artist: @args.artist_name,
        api_key: lastfm_api_key,
        format: 'json',
        autocorrect: 1
      }
    end

    def error_data
      { error: 'Not found.' }
    end

    def artist_data
      {
        name: parsed_response['name'],
        mbid: parsed_response['mbid'],
        listeners_count: parsed_response['stats']['listeners'].to_i,
        plays_count: parsed_response['stats']['playcount'].to_i,
        description: description,
        tags: tags,
        similar_artists: similar_artists
      }
    end

    def description
      parsed_response['bio']['content'].match(
        %r{(.+)(?!<a href="http[s?]://www.last.fm/music/)}
      )[0]
    end

    def tags
      parsed_response['tags']['tag'].map { |t| t['name'] }
    end

    def similar_artists
      parsed_response['similar']['artist'].map { |a| a['name'] }
    end
  end
end
