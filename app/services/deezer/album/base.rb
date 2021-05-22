module Deezer
  module Album
    class Base < Deezer::Base
      API_METHOD = 'deezer.pageAlbum'.freeze
      include Deezer::Utils::Album

      private

      def primary_args
        [@args.album_id]
      end

      def no_data?
        album.blank?
      end

      def album
        @album ||= response_data.dig(
          'results', 'DATA'
        )
      end

      def payload
        {
          alb_id: @args.album_id,
          lang: 'en'
        }.to_json
      end

      def data
        { album: album_data }
      end
    end
  end
end
