RSpec.describe Bandcamp::Album::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when album present' do
      let(:output) do
        VCR.use_cassette(
          'services/bandcamp/album/tags/success'
        ) do
          subject.call(
            artist_id: '2707934946',
            album_id: '2530224521'
          )
        end
      end

      it { expect(output).to eq(bandcamp_album_tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong album' do
      let(:output) do
        VCR.use_cassette(
          'services/bandcamp/album/tags/wrong_album'
        ) do
          subject.call(
            artist_id: '2707934946',
            album_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
