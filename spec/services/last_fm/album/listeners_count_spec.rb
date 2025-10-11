RSpec.describe LastFM::Album::ListenersCount do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and album exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/album/listeners_count/success'
        ) do
          subject.call(
            artist_name: 'wild nothing',
            album_title: 'nocturne'
          )
        end
      end

      it { expect(output).to eq(lastfm_album_listeners_count_data) }
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

    context 'when wrong album title' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/album/listeners_count/wrong_title'
        ) do
          subject.call(
            artist_name: 'wild nothing',
            album_title: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
