# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

UserRole.delete_all
UserRole.create(:name => "CompanyUser")
UserRole.create(:name => "ClientUSer")

Country.delete_all
Country.create!(:name => "Argentina")

Title.delete_all
Title.create!(:name => "Ind. Masculina", :icon_name =>"indumentaria-masculina")
Title.create!(:name => "Ind. Femenina", :icon_name =>"indumentaria-femenina")
Title.create!(:name => "Ninos", :icon_name =>"nenes")
Title.create!(:name => "Gastronomia", :icon_name =>"gastronomia")
Title.create!(:name => "Viajes y Hoteles", :icon_name =>"viajes")
Title.create!(:name => "Belleza", :icon_name =>"belleza")
Title.create!(:name => "Deportes", :icon_name =>"deporte")
Title.create!(:name => "Cine", :icon_name =>"cine")
Title.create!(:name => "Teatro", :icon_name =>"teatro")
Title.create!(:name => "Electronica", :icon_name =>"electronicos")
Title.create!(:name => "Estudio", :icon_name =>"estudio")
Title.create!(:name => "Hogar", :icon_name =>"hogar")


