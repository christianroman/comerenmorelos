object @restaurant

attributes :id, :name, :street, :district, :zipcode, :phone, :website, :email, :fare_id, :video, :paypal, :description, :services, :lat, :lng

child :photos do

  node :thumb do |d|
    d.data(:thumb)
  end

  node :medium do |d|
    d.data(:medium)
  end

  node :original do |d|
    d.data(:original)
  end

end

child :destination do
  attributes :id, :name
end
