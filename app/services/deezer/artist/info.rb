module Deezer
  module Artist
    class Info < Deezer::Artist::Base
      API_METHOD = 'deezer.pageArtist'.freeze

      include Deezer::Mixins::Artist

      private

      def not_found?
        raw_artist_data.blank?
      end

      def raw_artist_data
        response_data.dig(
          'results',
          'DATA'
        )
      end

      def request_payload
        {
          art_id: @args[:artist_id],
          lang: language
        }.to_json
      end
    end
  end
end
