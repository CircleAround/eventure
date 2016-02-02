require 'rails_helper'

describe Event do
  describe '#created_by?' do
    let(:event) { create(:event) }
    subject { event.created_by?(user) }

    context '引数がnilなとき' do
      let(:user) { nil }
      it { is_expected.to be_falsey }
    end

    context '#owner_idと引数の#idが同じとき' do
      let(:user) { double('user', id: event.id) }
      it { is_expected.to be_truthy }
    end
  end

  describe '#start_time_should_be_before_end_time' do
    subject {event.send(:start_time_should_be_before_end_time)}

    context '開始時間が終了時間より遅いとき' do
      let(:start_time) { DateTime.new(2020, 8, 9, 00, 00, 00, 'Tokyo') }
      let(:end_time) { DateTime.new(2020, 7, 24, 00, 00, 00, 'Tokyo') }
      let(:event) { build(:event, start_time: start_time, end_time: end_time) }
      it 'エラーを返すこと' do
        expect(event).to be_invalid
      end
    end

    context '開始時間と終了時間が同じとき' do
      let(:start_time) { DateTime.new(2020, 7, 24, 00, 00, 00, 'Tokyo') }
      let(:end_time) { DateTime.new(2020, 7, 24, 00, 00, 00, 'Tokyo') }
      let(:event) { build(:event, start_time: start_time, end_time: end_time) }
      it 'エラーを返すこと' do
        expect(event).to be_invalid
      end
    end

    context '開始時間が終了時間より早いとき' do
      let(:start_time) { DateTime.new(2020, 7, 24, 00, 00, 00, 'Tokyo') }
      let(:end_time) { DateTime.new(2020, 8, 9, 00, 00, 00, 'Tokyo') }
      let(:event) { build(:event, start_time: start_time, end_time: end_time) }
      it 'エラーを返さないこと' do
        expect(event).to be_valid
      end
    end
  end
end
