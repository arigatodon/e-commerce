# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = []
Category.create(name: 'ecologico')
Category.create(name: 'cocina')
Category.create(name: 'tecnologia')
Category.create(name: 'diy')
Category.create(name: 'mueble')
Category.create(name: 'decoracion')
Category.create(name: 'eficiencia')
Category.create(name: 'local')
Category.create(name: 'comestible')