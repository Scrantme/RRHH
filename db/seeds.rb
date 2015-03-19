# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

candidate_1 = Candidate.create(:nombre => 'Juan', :apellido => 'Francescoli', :mail => 'test@test.com', :celular => '11 1234 5678', :otros_contactos => 'twitter@twitter', :perfil => 'Analista Tecnico Funcional', :tecnologia => 'Java', :seniority => 'Ssr')
