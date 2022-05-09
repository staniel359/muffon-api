module Deezer
  module Artist
    class Info < Deezer::Artist::Base
      API_METHOD = 'deezer.pageArtist'.freeze

      private

      def primary_args
        [@args[:artist_id]]
      end

      def no_data?
        artist.blank?
      end

      def artist
        response_data.dig(
          'results', 'DATA'
        )
      end

      def payload
        {
          art_id: @args[:artist_id],
          lang: language
        }.to_json
      end

      def name
        artist['ART_NAME']
      end
    end
  end
end
