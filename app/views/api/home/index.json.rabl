object false
child (@destinations){ attributes :id, :name }
child (@fares) { attributes :id, :name, :start, :end }
child (@categories) {attributes :id, :name }
node(:status) { @status }
