RSpec.describe YandexMusic::Search::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette(
          'services/yandexmusic/search/albums/success'
        ) do
          subject.call(
            query: 'a',
            page: 2,
            profile_id: 1
          )
        end
      end

      it { expect(output).to eq(yandexmusic_search_albums_data) }
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
          'services/yandexmusic/search/albums/wrong_query'
        ) do
          subject.call(
            query: random_string
          )
        end
      end

      it { expect(output).to eq(no_albums_data) }
    end
  end
end
