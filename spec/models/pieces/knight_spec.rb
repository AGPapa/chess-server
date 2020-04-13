require "rails_helper"

RSpec.describe Pieces::Knight do
  let(:knight) { described_class.new(:side => "white") }

  describe ".can_move_to_target" do

    context "when the knight moves up two and right one" do
      let(:ply) { Ply.new(:move => "a1b3") }
      it "returns true" do
        expect(knight.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the knight moves down two and right one" do
      let(:ply) { Ply.new(:move => "a3b1") }
      it "returns true" do
        expect(knight.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the knight moves up two and left one" do
      let(:ply) { Ply.new(:move => "b1a3") }
      it "returns true" do
        expect(knight.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the knight moves down two and left one" do
      let(:ply) { Ply.new(:move => "b3a1") }
      it "returns true" do
        expect(knight.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the knight moves up one and right two" do
      let(:ply) { Ply.new(:move => "a1c2") }
      it "returns true" do
        expect(knight.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the knight moves down one and right two" do
      let(:ply) { Ply.new(:move => "a2c1") }
      it "returns true" do
        expect(knight.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the knight moves up one and left two" do
      let(:ply) { Ply.new(:move => "c1a2") }
      it "returns true" do
        expect(knight.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the knight moves down one and left two" do
      let(:ply) { Ply.new(:move => "c2a1") }
      it "returns true" do
        expect(knight.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the knight moves up two and right two" do
      let(:ply) { Ply.new(:move => "a1c3") }
      it "returns false" do
        expect(knight.can_move_to_target(:ply => ply)).to eql(false)
      end
    end
  end


  describe ".path_to_target" do
    let(:ply) { Ply.new(:move => "a1c2") }
    it "returns an empty array" do
      expect(knight.path_to_target(:ply => ply)).to eql([])
    end
  end
end
