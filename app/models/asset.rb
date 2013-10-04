class Asset < ActiveRecord::Base
    has_attached_file :data, :styles => { :blur => { :processors => [:blur] } }
    belongs_to :setting
    attr_accessible :setting_id, :data

    validates_attachment_content_type :data, :content_type => [ 'image/jpeg', 'image/jpg', 'image/png' ], :message => 'Formato de imagenes no valido.'
    validates_attachment_size :data, :less_than => 10.megabytes
end
