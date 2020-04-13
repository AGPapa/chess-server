require "rails_helper"

RSpec.describe Pieces::Rook do
  describe ".can_move_to_target" do
    let(:rook) { described_class.new(:side => "white") }

    context "when the rook moves in along a row" do
      it "returns true" do
        expect(rook.can_move_to_target(:start_row => 2, :start_column => 2, :end_row => 2, :end_column => 5)).to eql(true)
      end
    end

    context "when the rook moves in along a column" do
      it "returns true" do
        expect(rook.can_move_to_target(:start_row => 2, :start_column => 2, :end_row => 5, :end_column => 2)).to eql(true)
      end
    end

    context "when the rook moves in along a row and a column" do
      it "returns false" do
        expect(rook.can_move_to_target(:start_row => 2, :start_column => 2, :end_row => 5, :end_column => 5)).to eql(false)
      end
    end
  end
end
