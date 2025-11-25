RSpec.describe Discogs::Group::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when group_id given' do
      let(:output) do
        VCR.use_cassette(
          'services/discogs/group/info/success'
        ) do
          subject.call(
            group_id: '5319',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(discogs_group_info_data) }
    end

    context 'when different artists' do
      let(:output) do
        VCR.use_cassette(
          'services/discogs/group/info/different_artists'
        ) do
          subject.call(
            group_id: '992584',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(discogs_group_info_different_artists_data) }
    end

    context 'when multiple artists' do
      let(:output) do
        VCR.use_cassette(
          'services/discogs/group/info/multiple_artists'
        ) do
          subject.call(
            group_id: '1531968',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(discogs_group_info_multiple_artists_data) }
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
          'services/discogs/group/info/wrong_id'
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
