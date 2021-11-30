module Muffon
  module Profile
    module Listened
      module Artist
        class Creator < Muffon::Profile::Base
          include Muffon::Utils::Artist

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:name]
            ]
          end

          def data
            return forbidden if wrong_profile?

            listened_artist

            return errors_data if errors?

            { listened_id: listened_artist.id }
          end

          def listened_artist
            @listened_artist ||=
              profile.listened_artists.where(
                artist_id: find_artist.id
              ).first_or_create
          end

          def name
            @args[:name]
          end

          def errors?
            listened_artist.errors.any?
          end
        end
      end
    end
  end
end
