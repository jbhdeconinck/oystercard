require './lib/oystercard'

describe Oystercard do

  it 'allows to check balance of the card' do
    expect(subject.balance).to eq(0)
  end

  it 'allows to check if card is in journey' do
    expect(subject.in_journey).to eq(false)
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

  describe '#deduct' do
    it {is_expected.to respond_to(:deduct).with(1).argument}

    it 'can deduct the balance by an amount' do
      expect{subject.deduct(1)}.to change{subject.balance}.by -1
    end
  end

  describe '#touch_in' do

    context "when customer touch in" do
      it 'is in journey' do
        expect{subject.touch_in}.to change{subject.in_journey}.from(false).to(true)
      end
    end
  end

  describe '#touch_out' do

    context "when customer touch out" do
      it 'is in journey' do
        subject.touch_in
        expect{subject.touch_out}.to change{subject.in_journey}.from(true).to(false)
      end
    end
  end

end
