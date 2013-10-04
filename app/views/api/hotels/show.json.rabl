object @hotel

attributes :id, :name, :street, :district, :zipcode, :phone, :website, :email, :fare_id, :video, :paypal, :description

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

child :rooms do
    attributes :id, :name, :fare
end
