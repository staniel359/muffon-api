RSpec.describe Discogs::Search::Labels do
  subject { described_class }

  describe 'successful processing' do
    context 'when query string given' do
      let(:output) do
        VCR.use_cassette(
          'services/discogs/search/labels/success'
        ) do
          subject.call(
            query: 'kate bush',
            page: '2',
            limit: '5'
          )
        end
      end

      it { expect(output).to eq(discogs_search_labels_data) }
    end
  end

  describe 'no processing' do
    context 'when no query string given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong query string' do
      let(:output) do
        VCR.use_cassette(
          'services/discogs/search/labels/wrong_query'
        ) do
          subject.call(
            query: random_string
          )
        end
      end

      it { expect(output).to eq(search_paginated_missing_labels_data) }
    end
  end
end
