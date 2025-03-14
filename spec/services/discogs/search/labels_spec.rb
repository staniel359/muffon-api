RSpec.describe Discogs::Search::Labels do
  subject { described_class }

  describe 'successful processing' do
    context 'when query string given' do
      let(:output) do
        VCR.use_cassette 'services/discogs/search/labels/success' do
          subject.call(query: 'kate bush', limit: 5, page: 2)
        end
      end

      it { expect(output).to eq(Helpers::Discogs::Search.labels_data) }
    end
  end

  describe 'no processing' do
    context 'when no query string given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query string' do
      let(:output) do
        VCR.use_cassette 'services/discogs/search/labels/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Search.no_labels_data) }
    end
  end
end
