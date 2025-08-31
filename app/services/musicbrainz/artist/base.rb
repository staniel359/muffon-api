module MusicBrainz
  module Artist
    class Base < MusicBrainz::Base
      def call
        check_args

        check_if_not_found

        data
      rescue Faraday::BadRequestError
        raise not_found_error
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
          MusicBrainz::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      def link
        "#{BASE_LINK}/artist/#{@args[:artist_id]}"
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
