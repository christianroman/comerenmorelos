class Restaurant < ActiveRecord::Base

  #before_create :create_slug
  before_save :create_slug

  validate :validate_max_categories_have_not_been_reached

  attr_accessible :destination_id, :district, :email, :fare_id, :id, :name, :description, :description_place, :paypal, :phone_area_code, :phone, :street, :video, :website, :zipcode, :services, :lat, :lng, :active, :slug, :photos_attributes, :category_ids
  belongs_to :fare 
  belongs_to :destination
  has_many :users
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :restaurants_promos
  has_many :promos, :through => :restaurants_promos
  has_many :rooms
  has_many :reservations
  has_many :contacts
  has_many :availabilities
  #has_many :guests, :through => :reservations
  has_many :guests
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :reject_if => lambda {|t| t['data'].nil?}, :allow_destroy => true

  def self.search(destinations, fares, categories, promos)
    scope = Restaurant.scoped({})
    scope = scope.scoped :conditions => ["restaurants.active = (?)", true]
    scope = scope.scoped :conditions => ["restaurants.destination_id IN (?)", destinations] unless destinations.blank?
    scope = scope.scoped :conditions => ["restaurants.fare_id IN (?)", fares] unless fares.blank?
    scope = scope.scoped :conditions => ["categorizations.category_id IN (?)", categories], :joins => :categorizations unless categories.blank?
    scope = scope.scoped :conditions => ["restaurants_promos.promo_id IN (?)", promos], :joins => :restaurants_promos unless promos.blank?
    scope = scope.uniq { |x| x[:id] }
    scope
  end

  def create_slug
    self.slug = self.name.parameterize.gsub('-', '')
  end

  def validate_max_categories_have_not_been_reached
    errors.add(:base, "No se permite seleccionar mas de 2 categorias. Favor de corregir este error.") unless self.categories.size < 3
  end

end
