require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do

  let(:chef) { double("chef", name: "person") }

  describe "#initialize" do

  subject(:dessert) {Dessert.new('cake', 10, 'chef')}

    it "sets a type" do
      expect(dessert.type).to eq('cake')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new('pie', 'str', 'chef')}.to raise_error(ArgumentError)
    end
  
  end

  describe "#add_ingredient" do
  subject(:pie) {Dessert.new('pie', 10, 'chef')}
    it "adds an ingredient to the ingredients array" do
      pie.add_ingredient('sugar')
      expect(pie.ingredients).to eq(['sugar'])
    end
  end

  describe "#mix!" do
  subject(:pie) {Dessert.new('pie', 10, 'chef')}
    it "shuffles the ingredient array" do
      pie.add_ingredient('sugar')
      pie.add_ingredient('spice')
      expect(pie.mix!).to eq(['sugar', 'spice'])
    end
  end

  describe "#eat" do
  subject(:pie) {Dessert.new('pie', 10, 'chef')}

    it "subtracts an amount from the quantity" do
      pie.eat(5)
      expect(pie.quantity).to eq(5)
    end
      

    it "raises an error if the amount is greater than the quantity" do
      expect {pie.eat(11)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
    end
      
  end

  describe "#make_more" do
    subject(:pie) {Dessert.new('pie', 10, chef)}
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(pie)
      pie.make_more
    end
  end
end
