# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.create([{name: 'Tiger', color: 'Orange', sex: 'M', birth_date: '2015-04-20', description: 'Nice cat'},
{name: 'Sam', color: 'White', sex: 'M', birth_date: '2017-06-15', description: 'Grumpy cat'},
{name: 'Mary', color: 'Black', sex: 'F', birth_date: '2018-01-14', description: 'Lazy kitty'}])