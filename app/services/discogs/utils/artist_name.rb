module Discogs
  module Utils
    class ArtistName < Discogs::Base
      def call
        data
      end

      private

      def data
        @args.artists.map do |a|
          [a['name'], artist_join(a['join'])]
        end.flatten.join
      end

      def artist_join(join)
        return join if join == ''

        pre_space = ' ' unless join == ','

        "#{pre_space}#{join} "
      end
    end
  end
end
