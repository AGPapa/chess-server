require "rails_helper"

RSpec.describe Pieces::Rook do
  include LocationInterpreter
  let(:rook) { described_class.new(:side => "white") }

  describe ".can_move_to_target" do
    context "when the rook moves in along a row" do
      it "returns true" do
        expect(rook.can_move_to_target(:ply => Ply.new(:move => "c3f3"))).to eql(true)
      end
    end

    context "when the rook moves in along a column" do
      it "returns true" do
        expect(rook.can_move_to_target(:ply => Ply.new(:move => "c3c6"))).to eql(true)
      end
    end

    context "when the rook moves in along a row and a column" do
      it "returns false" do
        expect(rook.can_move_to_target(:ply => Ply.new(:move => "c3f6"))).to eql(false)
      end
    end
  end

  describe ".path_to_target" do
    context "when the rook moves in along a row" do
      it "returns a list of spaces in its path" do
        expect(rook.path_to_target(:ply => Ply.new(:move => "c3f3"))).to match_array(
          [OpenStruct.new(:row => to_internal_row(:rank => 3), :column => to_internal_column(:file => "d")),
           OpenStruct.new(:row => to_internal_row(:rank => 3), :column => to_internal_column(:file => "e"))]
        )
      end
    end

    context "when the rook moves in along a column" do
      it "returns a list of spaces in its path" do
        expect(rook.path_to_target(:ply => Ply.new(:move => "c3c6"))).to match_array(
          [OpenStruct.new(:row => to_internal_row(:rank => 4), :column => to_internal_column(:file => "c")),
           OpenStruct.new(:row => to_internal_row(:rank => 5), :column => to_internal_column(:file => "c"))]
        )
      end
    end

    context "when the rook moves one space" do
      it "returns an empty array" do
        expect(rook.path_to_target(:ply => Ply.new(:move => "c3c4"))).to eql([])
      end
    end
  end
end
