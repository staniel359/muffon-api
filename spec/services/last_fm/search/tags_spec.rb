RSpec.describe LastFM::Search::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        subject.call(
          query: 'pop',
          page: '2'
        )
      end

      it { expect(output).to match_hash(lastfm_search_tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no query' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        subject.call(
          query: random_string
        )
      end

      it { expect(output).to match_hash(search_paginated_missing_tags_data) }
    end
  end
end
