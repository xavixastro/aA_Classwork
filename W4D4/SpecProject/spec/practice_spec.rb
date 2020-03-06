require 'rspec'
require 'practice'

describe "Array" do
  describe "remove_dups" do 
    it "removes dups from integers array" do
      expect([1,2,1,3,3].remove_dups).to eq([1,2,3])
      expect(['a', 'b', 'b', 'c'].remove_dups).to eq(['a', 'b', 'c'])
    end

    it "should not call built-in method uniq" do
      expect(['a', 'b', 'b', 'c']).not_to receive(:uniq)
    end

  end

  describe 'two_sum' do
    it 'returns sorted pairs of indices that sum to zero' do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4], [2,3]])
    end

  end

  describe 'my_transpose' do
    it 'returns a transposed array' do
      expect([[0, 1, 2],[3, 4, 5],[6, 7, 8]].my_transpose).to eq([[0,3,6], [1,4,7], [2,5,8]])
    end

    # it 'should not call build in method transpose or zip' do
    #   expect([[0, 1, 2],[3, 4, 5],[6, 7, 8]].my_transpose).not_to receive(:transpose)
    #   expect([[0, 1, 2],[3, 4, 5],[6, 7, 8]].my_transpose).not_to receive(:zip)
    # end

  end
end

describe 'stock_picker' do
  it 'should return the best day to buy and sell a stock in an array' do
    expect(stock_picker([30,25,40,45,20])).to eq([1,3])
  end

end

# describe 'towers' do
#   it 'should move the pile from the first tower to the last tower in the same order' do
#     expect(towers([[1,2,3,4], [], [] ])).to eq([[], [], [1,2,3,4] ])
#   end

# end

