module Muffon
  module Processor
    module Profile
      module Message
        class Creator < Muffon::Profile::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:other_profile_id],
              content_arg
            ]
          end

          def content_arg
            @args[:content].presence ||
              @args[:tracks].presence ||
              @args[:images].presence
          end

          def data
            return forbidden if wrong_profile?

            process_message
          end

          def process_message
            message

            return message.errors_data if
                message.errors?

            process_images

            { conversation_id: conversation.id }
          end

          def message
            @message ||=
              profile.messages.create(
                message_params
              )
          end

          def message_params
            {
              conversation_id: conversation.id,
              content: @args[:content],
              track_ids:
            }
          end

          def conversation
            conversations_with_other_profile.first_or_create(
              conversation_params
            )
          end

          def conversations_with_other_profile
            profile.conversations.where(
              'profile_id = :other_profile_id'\
              ' OR other_profile_id = :other_profile_id',
              other_profile_id: @args[:other_profile_id]
            )
          end

          def conversation_params
            @args.permit!.slice(
              *%i[profile_id other_profile_id]
            )
          end

          def track_ids
            return [] if @args[:tracks].blank?

            tracks.pluck(:id)
          end

          def tracks
            @args[:tracks].map do |t|
              process_track(t)
            end
          end

          def process_track(track)
            Muffon::Processor::Profile::Message::Creator::Track.call(
              track:
            )
          end

          def process_images
            message.process_images(
              @args[:images]
            )
          end
        end
      end
    end
  end
end
