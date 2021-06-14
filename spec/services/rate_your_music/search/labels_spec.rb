RSpec.describe RateYourMusic::Search::Labels do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'services/rateyourmusic/search/labels/success' do
          subject.call(query: 'a', page: 2)
        end
      end

      it { expect(output).to eq(Helpers::RateYourMusic::Search.labels_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'services/rateyourmusic/search/labels/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::RateYourMusic::Search.labels_not_found_data) }
    end
  end
end
