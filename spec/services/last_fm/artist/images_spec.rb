RSpec.describe LastFM::Artist::Images do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/artist/images/success'
        ) do
          subject.call(
            artist_name: 'wild nothing',
            page: '2'
          )
        end
      end

      it { expect(output).to eq(lastfm_artist_images_data) }
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
          'services/lastfm/artist/images/wrong_name'
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
