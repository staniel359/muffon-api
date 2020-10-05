module LastFM
  class Artist < LastFM::Base
    def call
      return not_found_data if parsed_response.blank?

      { artist: artist_data }
    end

    private

    def parsed_response
      @parsed_response ||= JSON.parse(
        api_response('artist.getinfo')
      )['artist']
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
