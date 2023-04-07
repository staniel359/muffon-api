RSpec.describe MusicBrainz::Search::Labels do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'services/musicbrainz/search/labels/success' do
          subject.call(query: 'polydor', limit: 5, page: 2, profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::MusicBrainz::Search.labels_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'services/musicbrainz/search/labels/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Search.no_labels_data) }
    end
  end
end
