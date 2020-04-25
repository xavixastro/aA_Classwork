# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

benches = Bench.create([{description: 'Castro bench', lat: 37.762633, lng: -122.435345}])
benches = Bench.create([{description: 'Powell bench', lat: 37.784400, lng: -122.407578}])
benches = Bench.create([{description: 'Presidio bench', lat: 37.801791, lng: -122.468672}])
