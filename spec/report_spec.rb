# frozen_string_literal: true

require 'report'

RSpec.describe Report, '#calculate' do
  context 'Calculate data1' do
    it 'should be correct' do
      expect(described_class.new.calculate('data1.csv')).to eq(76.3)
    end
  end

  context 'Calculate data2' do
    it 'should be correct' do
      expect(described_class.new.calculate('data2.csv')).to eq(92.5)
    end
  end

  context 'Calculate data_with_error' do
    it 'should be correct' do
      expect(described_class.new.calculate('data_with_error.csv')).to eq(80.5)
    end
  end
end
