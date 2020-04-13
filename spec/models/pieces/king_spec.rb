require "rails_helper"

RSpec.describe Pieces::King do
  let(:king) { described_class.new(:side => "white") }

  describe ".can_move_to_target" do
    context "when the king moves up one" do
      let(:ply) { Ply.new(:move => "a1a2") }
      it "returns true" do
        expect(king.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the king moves up one and right one" do
      let(:ply) { Ply.new(:move => "a1b2") }
      it "returns true" do
        expect(king.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the king moves right one" do
      let(:ply) { Ply.new(:move => "a1b1") }
      it "returns true" do
        expect(king.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the king moves down one and right one" do
      let(:ply) { Ply.new(:move => "a2b1") }
      it "returns true" do
        expect(king.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the king moves down one" do
      let(:ply) { Ply.new(:move => "a2a1") }
      it "returns true" do
        expect(king.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the king moves down one and left one" do
      let(:ply) { Ply.new(:move => "b2a1") }
      it "returns true" do
        expect(king.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the king moves left one" do
      let(:ply) { Ply.new(:move => "b2a2") }
      it "returns true" do
        expect(king.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the king moves up one and left one" do
      let(:ply) { Ply.new(:move => "a2b1") }
      it "returns true" do
        expect(king.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the king moves up two" do
      let(:ply) { Ply.new(:move => "a1a3") }
      it "returns false" do
        expect(king.can_move_to_target(:ply => ply)).to eql(false)
      end
    end
  end

  describe ".path_to_target" do
    let(:ply) { Ply.new(:move => "a1a2") }
    it "returns an empty array" do
      expect(king.path_to_target(:ply => ply)).to eql([])
    end
  end
end
