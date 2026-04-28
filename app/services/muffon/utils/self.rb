module Muffon
  module Utils
    class Self < Muffon::Profile::Base
      MODELS_SCOPES_DATA = {
        'artist' => %w[
          library
          favorite
          bookmark
          listened
        ],
        'album' => %w[
          library
          favorite
          bookmark
          listened
        ],
        'track' => %w[
          library
          favorite
          bookmark
          listened
        ],
        'video' => %w[
          favorite
          bookmark
          watched
        ],
        'video_playlist' => %w[
          bookmark
        ],
        'video_channel' => %w[
          bookmark
        ]
      }.freeze

      def call
        check_args

        return if @args[:profile_id].blank?

        check_if_not_found unless test?

        check_if_forbidden unless test?

        data
      end

      private

      def required_args
        [
          *super,
          :token,
          :model,
          :model_id
        ]
      end

      def forbidden?
        !valid_profile?
      end

      def data
        raw_self_data.to_h do |result_data|
          [
            result_data['key'].to_sym,
            result_data['value']
          ]
        end
      end

      def raw_self_data
        ActiveRecord::Base
          .connection
          .execute(
            model_query
          )
      end

      def model_query
        model_queries.join(' UNION ')
      end

      def model_queries
        model_scopes.map do |scope|
          format_scope_query(scope)
        end
      end

      def model_scopes
        MODELS_SCOPES_DATA[@args[:model]]
      end

      def format_scope_query(
        scope
      )
        table_name = "#{scope}_#{collection_name}"

        <<~SQL.squish
          SELECT
            id AS value,
            '#{scope}_id' AS key
          FROM "#{table_name}"
          WHERE
            "#{table_name}"."profile_id" = #{profile_id}
            AND
            "#{table_name}"."#{@args[:model]}_id" = #{@args[:model_id]}
        SQL
      end

      def collection_name
        @args[:model].pluralize
      end

      def profile_id
        if test?
          1
        else
          profile_record.id
        end
      end
    end
  end
end
