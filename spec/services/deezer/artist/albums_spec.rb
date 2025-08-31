RSpec.describe Deezer::Artist::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist_id present' do
      let(:output) do
        VCR.use_cassette(
          'services/deezer/artist/albums/success'
        ) do
          subject.call(
            artist_id: '1049',
            album_type: 'album',
            limit: 5,
            page: 2,
            profile_id: 1
          )
        end
      end

      it { expect(output).to eq(deezer_artist_albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist_id' do
      let(:output) do
        subject.call(
          album_type: 'album'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when no album_type' do
      let(:output) do
        subject.call(
          artist_id: '1049'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong artist_id' do
      let(:output) do
        VCR.use_cassette(
          'services/deezer/artist/albums/wrong_id'
        ) do
          subject.call(
            artist_id: random_string,
            album_type: 'album'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
