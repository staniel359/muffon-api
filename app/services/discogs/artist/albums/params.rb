module Discogs
  module Artist
    class Albums
      class Params < Discogs::Artist::Albums
        def call
          data
        end

        private

        def primary_args
          [
            @args[:artist_id],
            @args[:album_type]
          ]
        end

        def data
          {
            'operationName' =>
              'ArtistDiscographyData',
            'variables' =>
              variables_params.to_json,
            'extensions' =>
              extensions_params.to_json
          }
        end

        def variables_params
          variables_base_params
            .merge(variables_type_params)
            .merge(variables_other_params)
        end

        def variables_base_params
          {
            'discogsId' =>
              @args[:artist_id].to_i,
            'sortDirection' => 'ASC',
            'perPage' => limit,
            'desiredPage' => page
          }
        end

        def variables_type_params
          {
            'headers' => [
              variables_type_headers_params
            ],
            'creditCategory' => 'Releases',
            'releaseTypes' => [
              @args[:album_type]
            ]
          }
        end

        def variables_type_headers_params
          {
            'headerName' =>
              @args[:album_type],
            'headerType' => 'RELEASETYPE'
          }
        end

        def variables_other_params
          {
            'artistPages' => [],
            'creditName' => '',
            'formats' => [],
            'labels' => [],
            'countries' => [],
            'anvs' => [],
            'search' => ''
          }
        end

        def extensions_params
          {
            'persistedQuery' => {
              'version' => 1,
              'sha256Hash' =>
                '037c99d2a23ca49576b23602814853a9' \
                'ccb1edb8d3c4af98e1e88ba15dcc56ac'
            }
          }
        end
      end
    end
  end
end
