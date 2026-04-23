module VK
  module Artist
    class Base < VK::Base
      def call
        # TODO: to remove later
        raise not_found_error unless test?

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
          VK::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      alias raw_artist_data response_data
    end
  end
end
