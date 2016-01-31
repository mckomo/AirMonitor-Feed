require 'active_support/all'
require 'lib/time_range'

RSpec.describe TimeRange do

  let(:start_time) { Time.parse('2015-05-10 15:00') }
  let(:end_time) { Time.parse('2015-05-12 11:00') }
  let(:half_time) { Time.at((start_time.to_i + end_time.to_i) / 2.0) }

  subject(:time_range) { TimeRange.new(start_time, end_time) }

  describe '.split_by_calendar_day' do

    subject(:partials) { time_range.split_by_calendar_days }

    it 'returns an array of the time rage partials' do
      expect(partials).to all(be_a(TimeRange))
    end

      describe 'returned array' do

        it 'has cardinality equal to number of calendar days in subject'  do
          expect(partials.count).to eq(calendar_days_in(time_range))
        end

        describe 'first partial' do

          subject(:first) { partials.first }

          it 'starts same as the subject' do
            expect(first.begin).to eq(time_range.begin)
          end

          it 'ends at the end of the first calendar day' do
            expect(first.end).to eq(time_range.begin.end_of_day)
          end

        end

        describe 'middle partial' do

          subject(:middle) { partials.at(1) }

          it 'covers whole day' do
            expect(middle).to eq(half_time.all_day)
          end

        end

        describe 'last partial' do

          subject(:last) { partials.last }

          it 'starts at the beginning of the last calendar daynge' do
            expect(last.begin).to eq(time_range.end.beginning_of_day)
          end

          it 'ends same as the subject' do
            expect(last.end).to eq(time_range.end)
          end

        end

      end

  end

  def calendar_days_in(time_range)
    (time_range.end.to_date - time_range.begin.to_date).to_i + 1
  end

end