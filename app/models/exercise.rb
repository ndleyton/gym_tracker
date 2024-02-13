class Exercise < ApplicationRecord
  belongs_to :routine
  belongs_to :exercise_type
  INTENSITY_MEASUREMENTS = %w[Kgs Lbs Level min sec other].freeze
  validates :intensity_measurement, inclusion: { in: INTENSITY_MEASUREMENTS }
end
