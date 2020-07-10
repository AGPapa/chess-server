require "rails_helper"

RSpec.describe Pieces::Pawn do
  let(:pawn) { described_class.new(:side => side) }

  describe ".can_move_to_target" do
    context "when a white pawn moves up one" do
      let(:side) { "white" }
      let(:ply) { Ply.new(:move => "a2a3") }
      it "returns true" do
        expect(pawn.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when a black pawn moves up one" do
      let(:side) { "black" }
      let(:ply) { Ply.new(:move => "a2a3") }
      it "returns false" do
        expect(pawn.can_move_to_target(:ply => ply)).to eql(false)
      end
    end

    context "when a white pawn moves down one" do
      let(:side) { "white" }
      let(:ply) { Ply.new(:move => "a7a6") }
      it "returns false" do
        expect(pawn.can_move_to_target(:ply => ply)).to eql(false)
      end
    end

    context "when a black pawn moves down one" do
      let(:side) { "black" }
      let(:ply) { Ply.new(:move => "a7a6") }
      it "returns true" do
        expect(pawn.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the pawn moves up two and right two" do
      let(:side) { "white" }
      let(:ply) { Ply.new(:move => "a1c3") }
      it "returns false" do
        expect(pawn.can_move_to_target(:ply => ply)).to eql(false)
      end
    end

    context "when a white pawn moves up two on its first move" do
      let(:side) { "white" }
      let(:ply) { Ply.new(:move => "a2a4") }
      it "returns true" do
        expect(pawn.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when a white pawn moves up two on its second move" do
      let(:side) { "white" }
      let(:ply) { Ply.new(:move => "a3a5") }
      it "returns false" do
        expect(pawn.can_move_to_target(:ply => ply)).to eql(false)
      end
    end

    context "when a black pawn moves down two on its first move" do
      let(:side) { "black" }
      let(:ply) { Ply.new(:move => "a7a5") }
      it "returns true" do
        expect(pawn.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when a black pawn moves down two on its second move" do
      let(:side) { "black" }
      let(:ply) { Ply.new(:move => "a6a4") }
      it "returns false" do
        expect(pawn.can_move_to_target(:ply => ply)).to eql(false)
      end
    end
  end
end
