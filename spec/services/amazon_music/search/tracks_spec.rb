RSpec.describe AmazonMusic::Search::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'services/amazonmusic/search/tracks/success' do
          subject.call(query: 'wild nothing', page: 'tztok-v2_iosmAqq9RWIFJZXCZvgM5KL86iVczeoXHvSFkpu2H9_r-Q67SFjemijtDH7onDyD', profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::AmazonMusic::Search.tracks_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'services/amazonmusic/search/tracks/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Search.amazonmusic_no_tracks_data) }
    end
  end
end
