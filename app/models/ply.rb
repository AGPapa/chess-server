# frozen_string_literal: true

class Ply < ApplicationRecord
  belongs_to :game

  validates :move, :presence => true
end
