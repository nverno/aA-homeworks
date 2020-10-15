require 'rspec'
require 'dessert'

# Instructions: implement all of the pending specs (the `it` statements without
# blocks)! Be sure to look over the solutions when you're done.

describe Dessert do
  let(:chef) { double("chef", :titleize => "Chef") }
  let(:dessert) { Dessert.new('gelato', 2, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('gelato')
    end
    
    it "sets a quantity" do
      expect(dessert.quantity).to eq(2)
    end
    
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('gelato', '2 scoops', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient('cream')
      dessert.add_ingredient('sugar')
      expect(dessert.ingredients).to eq(['cream', 'sugar'])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient('cream')
      dessert.add_ingredient('sugar')
      dessert.mix!
      expect(dessert.ingredients).to match_array(['sugar', 'cream'])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1)
      expect(dessert.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(3) }.to raise_error(Exception)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include("Chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(dessert)
      dessert.make_more
      expect(chef).to have_received(:bake).with(dessert)
    end
  end
end
