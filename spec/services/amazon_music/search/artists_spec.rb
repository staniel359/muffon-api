RSpec.describe AmazonMusic::Search::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette(
          'services/amazonmusic/search/artists/success'
        ) do
          subject.call(
            query: 'john',
            page: 'tztok-v2_yDSNVKX4qpcJP1qqK8Cky1NpVKbIZ68TMgYWE7Mdp3rCko74SgprBHLhKs8Vx6ZA',
            profile_id: 1
          )
        end
      end

      it { expect(output).to eq(amazonmusic_search_artists_data) }
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
          'services/amazonmusic/search/artists/wrong_query'
        ) do
          subject.call(
            query: random_string
          )
        end
      end

      it { expect(output).to eq(amazonmusic_no_artists_data) }
    end
  end
end
