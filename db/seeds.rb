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

Title.create!(:name => "Indumentaria Masculina")
Title.create!(:name => "Indumentaria Femenina")
Title.create!(:name => "Ninos")
Title.create!(:name => "Gastronomia")
Title.create!(:name => "Viajes y Hoteles")
Title.create!(:name => "Belleza")
Title.create!(:name => "Deportes")
Title.create!(:name => "Cine")
Title.create!(:name => "Teatro")
Title.create!(:name => "Electronica")
Title.create!(:name => "Estudio")
Title.create!(:name => "Hogar")


