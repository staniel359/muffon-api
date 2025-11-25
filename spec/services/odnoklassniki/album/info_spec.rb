RSpec.describe Odnoklassniki::Album::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_id present' do
      let(:output) do
        VCR.use_cassette(
          'services/odnoklassniki/album/info/success'
        ) do
          subject.call(
            album_id: '122881922573186',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(odnoklassniki_album_info_data) }
    end
  end

  describe 'no processing' do
    context 'when no album_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong album_id' do
      let(:output) do
        VCR.use_cassette(
          'services/odnoklassniki/album/info/wrong_id'
        ) do
          subject.call(
            album_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
