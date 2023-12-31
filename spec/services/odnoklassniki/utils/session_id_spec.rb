RSpec.describe Odnoklassniki::Utils::SessionId do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette 'services/odnoklassniki/utils/session_id/success' do
        subject.call
      end
    end

    it { expect(output).to eq(Helpers::Odnoklassniki::Utils.session_id) }
  end
end
