RSpec.describe LastFM::Multitag::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when tags present' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/multitag/artists/success'
        ) do
          subject.call(
            tags: %w[80s pop],
            limit: 5,
            page: 2,
            profile_id: 1
          )
        end
      end

      it { expect(output).to eq(lastfm_multitag_artists_data) }
    end
  end

  describe 'no processing' do
    context 'when no tags' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong tags' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/multitag/artists/wrong_query'
        ) do
          subject.call(
            tags: [
              random_string
            ]
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
