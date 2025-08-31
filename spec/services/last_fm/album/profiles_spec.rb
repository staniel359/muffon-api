RSpec.describe LastFM::Album::Profiles do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and album exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/album/profiles/success'
        ) do
          subject.call(
            artist_name: 'wild nothing',
            album_title: 'nocturne',
            limit: 5,
            page: 2
          )
        end
      end

      it { expect(output).to eq(lastfm_album_profiles_data) }
    end
  end

  describe 'no processing' do
    context 'when no album title given' do
      let(:output) do
        subject.call(
          artist_name: 'wild nothing'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when no artist name given' do
      let(:output) do
        subject.call(
          album_title: 'nocturne'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong album title' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/album/profiles/wrong_title'
        ) do
          subject.call(
            artist_name: 'wild nothing',
            album_title: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/album/profiles/wrong_artist'
        ) do
          subject.call(
            artist_name: random_string,
            album_title: 'nocturne'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
