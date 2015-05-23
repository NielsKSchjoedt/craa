class Driver < ActiveRecord::Base
  belongs_to :race_car
  
  validates_presence_of :full_name

  has_attached_file :profile_picture, :styles => { :large => "600x600>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/
end
