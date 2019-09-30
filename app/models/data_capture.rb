class DataCapture < ActiveRecord::Base
  validates :data, :title, presence: true
  serialize :data

  has_many :data_analyses
end
