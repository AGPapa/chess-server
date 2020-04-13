require "rails_helper"

RSpec.describe Pieces::Bishop do
  let(:bishop) { described_class.new(:side => "white") }

  describe ".can_move_to_target" do
    context "when the bishop moves up one and right one" do
      let(:ply) { Ply.new(:move => "a1b2") }
      it "returns true" do
        expect(bishop.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the bishop moves up three and right three" do
      let(:ply) { Ply.new(:move => "a1d4") }
      it "returns true" do
        expect(bishop.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the bishop moves up three and left three" do
      let(:ply) { Ply.new(:move => "d1a4") }
      it "returns true" do
        expect(bishop.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the bishop moves down three and right three" do
      let(:ply) { Ply.new(:move => "d4g1") }
      it "returns true" do
        expect(bishop.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the bishop moves down three and left three" do
      let(:ply) { Ply.new(:move => "d4a1") }
      it "returns true" do
        expect(bishop.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the bishop moves up three and right two" do
      let(:ply) { Ply.new(:move => "a1c4") }
      it "returns false" do
        expect(bishop.can_move_to_target(:ply => ply)).to eql(false)
      end
    end
  end

  describe ".path_to_target" do
    include LocationInterpreter

    context "when the bishop moves up and to the right" do
      it "returns a list of spaces in its path" do
        expect(bishop.path_to_target(:ply => Ply.new(:move => "a1d4"))).to match_array(
          [OpenStruct.new(:row => to_internal_row(:rank => "2"), :column => to_internal_column(:file => "b")),
           OpenStruct.new(:row => to_internal_row(:rank => "3"), :column => to_internal_column(:file => "c"))]
        )
      end
    end

    context "when the bishop moves up and to the left" do
      it "returns a list of spaces in its path" do
        expect(bishop.path_to_target(:ply => Ply.new(:move => "d1a4"))).to match_array(
          [OpenStruct.new(:row => to_internal_row(:rank => "2"), :column => to_internal_column(:file => "c")),
           OpenStruct.new(:row => to_internal_row(:rank => "3"), :column => to_internal_column(:file => "b"))]
        )
      end
    end

    context "when the bishop moves down and to the left" do
      it "returns a list of spaces in its path" do
        expect(bishop.path_to_target(:ply => Ply.new(:move => "d4a1"))).to match_array(
          [OpenStruct.new(:row => to_internal_row(:rank => "3"), :column => to_internal_column(:file => "c")),
           OpenStruct.new(:row => to_internal_row(:rank => "2"), :column => to_internal_column(:file => "b"))]
        )
      end
    end

    context "when the bishop moves down and to the right" do
      it "returns a list of spaces in its path" do
        expect(bishop.path_to_target(:ply => Ply.new(:move => "a4d1"))).to match_array(
          [OpenStruct.new(:row => to_internal_row(:rank => "3"), :column => to_internal_column(:file => "b")),
           OpenStruct.new(:row => to_internal_row(:rank => "2"), :column => to_internal_column(:file => "c"))]
        )
      end
    end

    context "when the bishop moves one space" do
      it "returns an empty array" do
        expect(bishop.path_to_target(:ply => Ply.new(:move => "a1b2"))).to eql([])
      end
    end
  end
end
