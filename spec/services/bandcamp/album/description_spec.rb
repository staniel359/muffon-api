RSpec.describe Bandcamp::Album::Description do
  subject { described_class }

  describe 'successful processing' do
    context 'when album present' do
      let(:output) do
        VCR.use_cassette(
          'services/bandcamp/album/description/success'
        ) do
          subject.call(
            artist_id: '2228040235',
            album_id: '452973411'
          )
        end
      end

      it { expect(output).to eq(bandcamp_album_description_data) }
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
          'services/bandcamp/album/description/wrong_album'
        ) do
          subject.call(
            artist_id: '2228040235',
            album_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
