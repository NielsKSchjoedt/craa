class Driver < ActiveRecord::Base
  belongs_to :race_car

  has_attached_file :profile_picture, :styles => { :large => "800x1024>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/
end
