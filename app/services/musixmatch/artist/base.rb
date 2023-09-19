module MusixMatch
  module Artist
    class Base < MusixMatch::Base
      private

      def primary_args
        [@args[:artist_id]]
      end

      def params
        super.merge(
          artist_params
        )
      end

      def artist_params
        { artist_id: @args[:artist_id] }
      end

      def data
        { artist: artist_data }
      end

      def artist_base_data
        { name: }
      end

      def name
        artist_info_data[:name]
      end

      def artist_info_data
        MusixMatch::Artist::Info.call(
          artist_id: @args[:artist_id]
        )[:artist]
      end
    end
  end
end
