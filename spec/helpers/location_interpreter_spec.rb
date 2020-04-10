require "rails_helper"

RSpec.describe LocationInterpreter do
  describe "#to_internal_row" do
    let(:ranks) { (1..8).to_a }
    let(:rows) { [7,6,5,4,3,2,1,0] }

    it "translates the rank to the correct row" do
      expect(ranks.length).to eq(8)
      ranks.each_with_index do |rank, index|
        expect(to_internal_row(:rank => rank)).to eq(rows[index])
      end
    end
  end

  describe "#to_internal_column" do
    let(:files) { ("a".."h").to_a }
    let(:columns) { [0,1,2,3,4,5,6,7] }

    it "translates the file to the correct column" do
      expect(files.length).to eq(8)
      files.each_with_index do |file, index|
        expect(to_internal_column(:file => file)).to eq(columns[index])
      end
    end
  end
end
