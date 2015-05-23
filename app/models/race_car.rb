class RaceCar < ActiveRecord::Base
  has_many :drivers, dependent: :destroy

  has_attached_file :picture, :styles => { :large => "800x1024>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end

