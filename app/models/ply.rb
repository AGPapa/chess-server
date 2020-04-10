# frozen_string_literal: true

class Ply < ApplicationRecord
  belongs_to :game, :optional => true

  validates :move, :presence => true

  include LocationInterpreter

  def start_row
    to_internal_row(:rank => move[1])
  end

  def start_column
    to_internal_column(:file => move[0])
  end

  def end_row
    to_internal_row(:rank => move[3])
  end

  def end_column
    to_internal_column(:file => move[2])
  end
end
