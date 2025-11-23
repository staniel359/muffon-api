module Spotify
  module Utils
    module Audio
      class Link
        class File < Spotify::Utils::Audio::Link
          FORMAT = 'OGG_VORBIS_160'.freeze

          def call
            check_args

            return if no_data?

            data
          end

          private

          def required_args
            %i[
              track_data
            ]
          end

          def no_data?
            file_group.blank? ||
              matched_file.blank?
          end

          def file_group
            @file_group ||=
              file_groups.find do |file_group|
                matched_file_group?(
                  file_group
                )
              end
          end

          def file_groups
            [
              track_data,
              *alternative_file_groups
            ]
          end

          def track_data
            @args[:track_data]
          end

          def alternative_file_groups
            track_data['alternative']
          end

          def matched_file_group?(
            file_group
          )
            Spotify::Utils::Audio::Link::File::GroupMatcher.call(
              file_group:
            )
          end

          def matched_file
            @matched_file ||=
              files.find do |file_data|
                matched_file?(
                  file_data
                )
              end
          end

          def files
            file_group['file']
          end

          def matched_file?(
            file_data
          )
            file_data['format'].to_s == FORMAT
          end

          def link
            "#{BASE_LINK}/storage-resolve/files/audio/interactive/#{file_id}"
          end

          def file_id
            matched_file['file_id'].unpack1('H*')
          end

          alias data response_data
        end
      end
    end
  end
end
