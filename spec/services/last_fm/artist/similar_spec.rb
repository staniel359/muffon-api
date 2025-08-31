RSpec.describe LastFM::Artist::Similar do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/artist/similar/success'
        ) do
          subject.call(
            artist_name: 'wild nothing',
            limit: 5,
            page: 2,
            profile_id: 1
          )
        end
      end

      it { expect(output).to eq(lastfm_artist_similar_data) }
    end

    context 'when artist exists and alternative' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/artist/similar/success_alternative'
        ) do
          subject.call(
            artist_name: 'norma loy',
            limit: 5,
            page: 2,
            profile_id: 1
          )
        end
      end

      it { expect(output).to eq(lastfm_artist_similar_alternative_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist name given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/artist/similar/wrong_name'
        ) do
          subject.call(
            artist_name: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
