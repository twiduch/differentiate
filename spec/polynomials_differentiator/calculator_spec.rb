# frozen_string_literal: true
require 'spec_helper'

describe Calculator do
  let(:subject) { Calculator.new }

  describe 'expected behaviour for' do
    it '3/2/1 is 6x+2' do
      subject.data = '3/2/1'
      expect(subject.result).to eq '6x+2'
    end

    it '4/3/2/1 is 12x^2+6x+2' do
      subject.data = '4/3/2/1'
      expect(subject.result).to eq '12x^2+6x+2'
    end

    it '4/3/0/1 is 12x^2+6x' do
      subject.data = '4/3/0/1'
      expect(subject.result).to eq '12x^2+6x'
    end

    it '4/-5/0/1 is 12x^2-10x' do
      subject.data = '4/-5/0/1'
      expect(subject.result).to eq '12x^2-10x'
    end
  end
end
