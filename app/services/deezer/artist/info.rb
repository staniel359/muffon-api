module Deezer
  module Artist
    class Info < Deezer::Artist::Base
      API_METHOD = 'deezer.pageArtist'.freeze

      private

      def name
        response_data.dig(
          'results',
          'DATA',
          'ART_NAME'
        )
      end

      def payload
        {
          art_id: @args[:artist_id],
          lang: language
        }.to_json
      end
    end
  end
end
