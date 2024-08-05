# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

file_data = {
  "style": [
    "Rome et Grèce Antique",
    "Haute époque-Renaissance-Louis XIII",
    "Louis XIV - Régence",
    "Louis XV - Transition",
    "Louis XVI - Directoire",
    "Empire - Consulat",
    "Louis Philippe-Restauration-Charles X",
    "Napoleon III",
    "Art Nouveau",
    "Art Déco",
    "Design Années 50-60",
    "Orientaliste",
    "Art d'Asie",
    "Art Premier",
    "Art moderne",
    "Antiquités anglaises"
  ],

  "century": [
    "16ème siècle",
    "17ème siècle",
    "18ème siècle",
    "19ème siècle",
    "20ème siècle"
  ],

  "category": [
    "couverts, ménagères",
    "pièces de forme",
    "services à café - thé",
    "services de table",
    "autres objets d'art religieux",
    "aromètres",
    "bois dorés",
    "boîtes, étuis, nécessaires, coffrets",
    "cadres anciens",
    "chenets, accessoires de cheminée",
    "colonnes, sellettes",
    "coupes, vasques, cassolettes",
    "encriers, ecritoires",
    "éventails",
    "jardinières, cache-pots",
    "miniatures",
    "objets d'art",
    "objets de décoration",
    "plateaux, vide-poches",
    "verrieres, rafraîchissoirs",
    "aquarelles",
    "dessins",
    "gouaches",
    "ravures - estampes",
    "icônes",
    "lithographies",
    "pastels",
    "photos",
    "autres bijoux",
    "barbotines, céramiques vernissées",
    "céramiques diverses",
    "antiquités du jardin, fontaines",
    "boiseries, portes, volets",
    "cheminées",
    "escaliers rampes balustres",
    "plaques de cheminée",
    "vitraux, ferronnerie, pierre",
    "assiettes et services en faïences",
    "objets décoratifs ,vases en faïence",
    "pièces de forme en faïence",
    "cartels anciens",
    "garnitures de cheminées",
    "horloges de parquet",
    "pendules anciennes",
    "appliques",
    "bougeoirs - flambeaux",
    "chandeliers-candélabres",
    "lampadaires",
    "lampes",
    "lampes à pétrole",
    "lampes bouillotte",
    "lampes de bureau",
    "lanternes",
    "lustres",
    "plafonniers et suspensions",
    "Meubles",
    "Militaria",
    "autres miroirs",
    "archéologie",
    "art forain",
    "art populaire",
    "art premier",
    "cannes anciennes",
    "cartes anciennes",
    "nstruments de musique",
    "nstruments scientifiques",
    "jeux anciens",
    "jouets anciens",
    "livres anciens",
    "numismatique",
    "objets de curiosité",
    "objets de marine",
    "tabacologie et opium",
    "vintage",
    "Peintures Et Tableaux Anciens",
    "Porcelaines",
    "Sculptures",
    "Sièges",
    "dentelles anciennes et broderie",
    "tapis",
    "tapisseries",
    "vêtements et costumes anciens",
    "autres montres anciennes",
    "cristal",
    "opalines, verres émaillés",
    "pâtes de verre",
    "vases et objets en verre",
    "verres à vin",
    "services verres anciens"
  ],
  
  "status": [
    "Very good",
    "good",
    "bad",
    "very bad"
  ],

  "matter": [
    "Ceramic",
    "paint",
    "rock",
    "tissue"
  ]
}

20.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456",
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    shopname: Faker::Company.name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number
  )
end


100.times do
  Item.create!(
    price: Faker::Commerce.price(range: 10..1000, as_string: true),
    content: Faker::Lorem.paragraph(sentence_count: 4),
    category: file_data[:category].sample,
    width: Faker::Number.between(from: 50, to: 200),
    length: Faker::Number.between(from: 50, to: 200),
    century: file_data[:century].sample,
    name: Faker::Commerce.product_name,
    style: file_data[:style].sample,
    height: Faker::Number.between(from: 50, to: 200),
    depth: Faker::Number.between(from: 50, to: 200),
    status: file_data[:status].sample,
    matter: file_data[:matter].sample,
    user_id: User.pluck(:id).sample,
  )
end
