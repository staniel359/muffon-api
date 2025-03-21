RSpec.describe Discogs::Label::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when label_id given' do
      let(:output) do
        VCR.use_cassette 'services/discogs/label/info/success' do
          subject.call(label_id: '26126')
        end
      end

      it { expect(output).to eq(Helpers::Discogs::Label.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no label_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong label_id' do
      let(:output) do
        VCR.use_cassette 'services/discogs/label/info/wrong_id' do
          subject.call(label_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
