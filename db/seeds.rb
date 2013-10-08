# encoding: utf-8

Role.create([{name: 'SuperAdmin'}, {name: 'RestaurantAdmin'}, {name:'RestaurantStaff'}])
User.create( email:'super@test.com', password:'@dmin123', password_confirmation:'@dmin123', role_ids:Array(1) )

#settings
Setting.create()

#destinations
destinations = [
  [1, 'AMACUZAC'],
  [2, 'ATLATLAHUCAN'],
  [3, 'AXOCHIAPAN'],
  [4, 'AYALA'],
  [5, 'COATLAN DEL RIO'],
  [6, 'CUAUTLA'],
  [7, 'CUERNAVACA'],
  [8, 'EMILIANO ZAPATA'],
  [9, 'HUITZILAC'],
  [10, 'JANTETELCO'],
  [11, 'JIUTEPEC'],
  [12, 'JOJUTLA'],
  [13, 'JONACATEPEC'],
  [14, 'MAZATEPEC'],
  [15, 'MIACATLAN'],
  [16, 'OCUITUCO'],
  [17, 'PUENTE DE IXTLA'],
  [18, 'TEMIXCO'],
  [19, 'TEPALCINGO'],
  [20, 'TEPOZTLAN'],
  [21, 'TETECALA'],
  [22, 'TETELA DEL VOLCAN'],
  [23, 'TLALNEPANTLA'],
  [24, 'TLALTIZAPAN'],
  [25, 'TLAQUILTENANGO'],
  [26, 'TLAYACAPAN'],
  [27, 'TOTOLAPAN'],
  [28, 'XOCHITEPEC'],
  [29, 'YAUTEPEC'],
  [30, 'YECAPIXTLA'],
  [31, 'ZACATEPEC DE HIDALGO'],
  [32, 'ZACUALPAN DE AMILPAS'],
  [33, 'TEMOAC'],
  [34, 'NO ESPECIFICADO'],
  [35, 'SE IGNORA']
]

destinations.each do |id, name|
    Destination.create( id:id, name:name.capitalize )
end

#fares
fares = [
    [1, '250-500', 250, 500],
    [2, '500-800', 500, 800],
    [3, '800-1200', 800, 1200],
    [4, '1200-1800', 1200, 1800],
    [5, '1800-2500', 1800, 2500],
    [6, '2500-3500', 2500, 3500],
    [7, 'Más de 3500', 3500, 100000]
]

fares.each do |id, name, start_val, end_val|
    Fare.create( id:id, name:name, start:start_val, end:end_val )
end

#categories
categories = [
    [1, 'Internacional'],
    [2, 'Mexicana'],
    [3, 'Arabe'],
    [4, 'Alemana'],
    [5, 'Asiatica'],
    [6, 'Española'],
    [7, 'Francesa'],
    [8, 'Hindú'],
    [9, 'Vegetariana'],
    [10, 'Snack']
]

categories.each do |id, name|
    Category.create( id:id, name:name )
end

#categorizations
categorizations = [
    [3, 2],
    [3, 4],
    [75, 1]
]

categorizations.each do |restaurant_id, category_id|
    Categorization.create( restaurant_id:restaurant_id, category_id:category_id )
end
