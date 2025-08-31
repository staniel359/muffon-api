RSpec.describe SoundCloud::Search::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette(
          'services/soundcloud/search/tracks/success'
        ) do
          subject.call(
            query: 'saint pepsi',
            limit: 10,
            page: 2,
            profile_id: 1
          )
        end
      end

      it { expect(output).to eq(soundcloud_search_tracks_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette(
          'services/soundcloud/search/tracks/wrong_query'
        ) do
          subject.call(
            query: random_string
          )
        end
      end

      it { expect(output).to eq(no_tracks_data) }
    end
  end
end
