RSpec.describe SoundCloud::Artist::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist present' do
      let(:output) do
        VCR.use_cassette(
          'services/soundcloud/artist/albums/success'
        ) do
          subject.call(
            artist_id: '3820545',
            limit: 5,
            page: 2,
            profile_id: 1
          )
        end
      end

      it { expect(output).to eq(soundcloud_artist_albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong artist' do
      let(:output) do
        VCR.use_cassette(
          'services/soundcloud/artist/albums/wrong_id'
        ) do
          subject.call(
            artist_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
