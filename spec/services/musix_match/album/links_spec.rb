RSpec.describe MusixMatch::Album::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_slug present' do
      let(:output) do
        VCR.use_cassette(
          'services/musixmatch/album/links/success'
        ) do
          subject.call(
            album_slug: 'Wild-Nothing/Nocturne-4',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(musixmatch_album_links_data) }
    end
  end

  describe 'no processing' do
    context 'when no album_slug given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong album_slug' do
      let(:output) do
        VCR.use_cassette(
          'services/musixmatch/album/links/wrong_slug'
        ) do
          subject.call(
            album_slug: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
