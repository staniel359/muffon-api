RSpec.describe MusixMatch::Artist::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist_slug present' do
      let(:output) do
        VCR.use_cassette(
          'services/musixmatch/artist/albums/success'
        ) do
          subject.call(
            artist_slug: 'Wild-Nothing',
            albums_type: 'album',
            page: '2',
            limit: '5',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(musixmatch_artist_albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist_slug given' do
      let(:output) do
        subject.call(
          albums_type: 'album'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when no albums_type given' do
      let(:output) do
        subject.call(
          artist_slug: 'Wild-Nothing'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong artist_slug' do
      let(:output) do
        VCR.use_cassette(
          'services/musixmatch/artist/albums/wrong_slug'
        ) do
          subject.call(
            artist_slug: random_string,
            albums_type: 'album'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
