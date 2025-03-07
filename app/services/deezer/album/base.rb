module Deezer
  module Album
    class Base < Deezer::Base
      API_METHOD = 'deezer.pageAlbum'.freeze

      include Deezer::Utils::Album

      def call
        return bad_request if not_all_args?
        return retry_with_fallback_album_id if
          retry_with_fallback_album_id?

        super
      end

      private

      def primary_args
        [@args[:album_id]]
      end

      def retry_with_fallback_album_id?
        fallback_album_id.present?
      end

      def fallback_album_id
        response_data.dig(
          'payload', 'FALLBACK', 'ALB_ID'
        )
      end

      def retry_with_fallback_album_id
        self.class.call(
          fallback_album_args
        )
      end

      def fallback_album_args
        @args.merge(
          { album_id: fallback_album_id }
        )
      end

      def no_data?
        album.blank?
      end

      def album
        response_data.dig(
          'results', 'DATA'
        )
      end

      def payload
        {
          alb_id: @args[:album_id],
          lang: language
        }.to_json
      end

      def data
        { album: album_data }
      end
    end
  end
end
