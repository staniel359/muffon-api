module Deezer
  module Artist
    class Base < Deezer::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          artist_id
        ]
      end

      def not_found?
        name.blank?
      end

      def name
        artist_info_data[:name]
      end

      def artist_info_data
        @artist_info_data ||=
          Deezer::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      alias artist response_data
    end
  end
end
