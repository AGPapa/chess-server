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
end
