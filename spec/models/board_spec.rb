require File.expand_path("../../config/environment", __dir__)
require "rspec/rails"

RSpec.describe Board do
  describe ".initialize" do
    let(:board) { described_class.new }

    it "has the correct structure" do
      expect(board.board).to eql(
      [["R", "N", "B", "Q", "K", "B", "N", "R"],
       ["P", "P", "P", "P", "P", "P", "P", "P"],
       [" ", " ", " ", " ", " ", " ", " ", " "],
       [" ", " ", " ", " ", " ", " ", " ", " "],
       [" ", " ", " ", " ", " ", " ", " ", " "],
       [" ", " ", " ", " ", " ", " ", " ", " "],
       ["P", "P", "P", "P", "P", "P", "P", "P"],
       ["R", "N", "B", "Q", "K", "B", "N", "R"]]
     )
    end
  end
end
