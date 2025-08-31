module MusixMatch
  module Artist
    class Base < MusixMatch::Base
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
        super ||
          name.blank?
      end

      def name
        artist_info_data[:name]
      end

      def artist_info_data
        @artist_info_data ||=
          MusixMatch::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      def params
        {
          **super,
          artist_id: @args[:artist_id]
        }
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
