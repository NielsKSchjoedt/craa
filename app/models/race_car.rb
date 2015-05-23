class RaceCar < ActiveRecord::Base
  has_many :drivers, dependent: :destroy

  validates_presence_of :start_no, :class_type, :make, :model
  validates :start_no, uniqueness: {scope: :class_type}
  accepts_nested_attributes_for :drivers
  paginates_per 30

  has_attached_file :picture, :styles => { :large => "600x600>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end

