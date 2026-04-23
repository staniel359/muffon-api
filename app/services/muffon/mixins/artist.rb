module Muffon
  module Mixins
    module Artist
      private

      def artist_record
        @artist_record ||=
          ::Artist.with_name(
            name
          )
      end

      def self_data
        Muffon::Utils::Self.call(
          **self_args,
          model: 'artist',
          model_id: artist_record.id
        )
      end
    end
  end
end
