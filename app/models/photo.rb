class Photo < ActiveRecord::Base
  has_attached_file :data, :styles => { :thumb => '150x140', :medium => '400x300', :big => '1024x768' }
  belongs_to :hotel
  attr_accessible :hotel_id, :data

  validates_attachment_content_type :data, :content_type => [ 'image/jpeg', 'image/png', 'image/jpg' ], :message => 'Formato de imagenes no valido.'
  validates_attachment_size :data, :less_than => 10.megabytes

end
