RSpec.describe MusicBrainz::Group::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when group_id given' do
      let(:output) do
        VCR.use_cassette 'services/musicbrainz/group/albums/success' do
          subject.call(group_id: 'b3c5541a-e1d0-354f-b6c8-565c37dde332', profile_id: 1, limit: 5, page: 2)
        end
      end

      it { expect(output).to eq(Helpers::MusicBrainz::Group.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no group_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong group_id' do
      let(:output) do
        VCR.use_cassette 'services/musicbrainz/group/albums/wrong_id' do
          subject.call(group_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
