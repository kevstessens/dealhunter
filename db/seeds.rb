# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

UserRole.create(:name => "CompanyUser")
UserRole.create(:name => "ClientUSer")

Country.create!(:name => "Argentina")

Titles.create!(:name => "Indumentaria")
Titles.create!(:name => "Gastronomía")
Titles.create!(:name => "Viajes y Hoteles")
Titles.create!(:name => "Belleza")
Titles.create!(:name => "Deportes")
Titles.create!(:name => "Cine")
Titles.create!(:name => "Teatro")
Titles.create!(:name => "Electrónica")
Titles.create!(:name => "Cursos")
Titles.create!(:name => "Muebles")
Titles.create!(:name => "Artículos para la casa")


