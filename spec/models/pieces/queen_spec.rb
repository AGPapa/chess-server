require "rails_helper"

RSpec.describe Pieces::Queen do
  let(:queen) { described_class.new(:side => "white") }

  describe ".can_move_to_target" do
    context "when the queen moves up one and right one" do
      let(:ply) { Ply.new(:move => "a1b2") }
      it "returns true" do
        expect(queen.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the queen moves up three and right three" do
      let(:ply) { Ply.new(:move => "a1d4") }
      it "returns true" do
        expect(queen.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the queen moves up three and left three" do
      let(:ply) { Ply.new(:move => "d1a4") }
      it "returns true" do
        expect(queen.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the queen moves down three and right three" do
      let(:ply) { Ply.new(:move => "d4g1") }
      it "returns true" do
        expect(queen.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the queen moves down three and left three" do
      let(:ply) { Ply.new(:move => "d4a1") }
      it "returns true" do
        expect(queen.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the queen moves right four" do
      let(:ply) { Ply.new(:move => "a1e1") }
      it "returns true" do
        expect(queen.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the queen moves left four" do
      let(:ply) { Ply.new(:move => "e1a1") }
      it "returns true" do
        expect(queen.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the queen moves up four" do
      let(:ply) { Ply.new(:move => "a1a5") }
      it "returns true" do
        expect(queen.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the queen moves down four" do
      let(:ply) { Ply.new(:move => "a5a1") }
      it "returns true" do
        expect(queen.can_move_to_target(:ply => ply)).to eql(true)
      end
    end

    context "when the queen moves up three and right two" do
      let(:ply) { Ply.new(:move => "a1c4") }
      it "returns false" do
        expect(queen.can_move_to_target(:ply => ply)).to eql(false)
      end
    end
  end
end
