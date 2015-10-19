require './lib/oystercard'

describe Oystercard do

  it 'allows to check balance of the card' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it {is_expected.to respond_to(:top_up).with(1).argument}

    it 'can top up the balance' do
      expect{subject.top_up(1)}.to change{subject.balance}.by 1
    end

    it 'raises an error if the balance is over a certain limit when topping up' do
      subject.top_up(90)
      expect{subject.top_up(1)}.to raise_error "Maximum limit of #{90} exceeded"
    end
  end



end
