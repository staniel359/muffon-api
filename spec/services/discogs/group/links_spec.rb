RSpec.describe Discogs::Group::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when group_id given' do
      let(:output) do
        VCR.use_cassette 'services/discogs/group/links/success' do
          subject.call(group_id: '5319')
        end
      end

      it { expect(output).to eq(Helpers::Discogs::Group.links_data) }
    end
  end

  describe 'no processing' do
    context 'when no group_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong group_id' do
      let(:output) do
        VCR.use_cassette 'services/discogs/group/links/wrong_id' do
          subject.call(group_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
