RSpec.describe MusicBrainz::Group::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when group_id given' do
      let(:output) do
        VCR.use_cassette(
          'services/musicbrainz/group/links/success'
        ) do
          subject.call(
            group_id: 'b3c5541a-e1d0-354f-b6c8-565c37dde332'
          )
        end
      end

      it { expect(output).to eq(musicbrainz_group_links_data) }
    end
  end

  describe 'no processing' do
    context 'when no group_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong group_id' do
      let(:output) do
        VCR.use_cassette(
          'services/musicbrainz/group/links/wrong_id'
        ) do
          subject.call(
            group_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
