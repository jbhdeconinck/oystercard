require './lib/oystercard'

describe Oystercard do

  it 'allows to check balance of the card' do
    expect(subject.balance).to eq(0)
  end


end
