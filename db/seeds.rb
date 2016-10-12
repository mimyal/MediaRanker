# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# MOVIES

# From Frankenstein ipsum #15 titles
names = ["It Was Calm", "Cold Gale", "Mind To Descend", "Greater Degree", "Breathless Eagerness", "Bend My Brother", "Agatha Fainted", "I Wept, Without Bounds", "I Feel His Death", "You On His Shadow", "He Was Firmly", "Many Other Plans", "The Most Imminent Peril", "Tranquil Conversation", "Highest Distinction"]

descriptions = [
  "Hateful day enjoy reality in private were in earlier years.",
  "During this operation, and doomed him live and must have no exercise to return to overcome by what comment can to my heart palpitated in bud.",
  "I must return to a few sounds, and wretchedness?",
  " And could taste the impulses were beginning of life.",
  "I experienced in about five hungry babes. Among these reflections threw myself to make me be regarded my ruin.",
  "When she believed it only criminal, for a letter disturb you; I am unfortunate; I bounded within me, that protracted my madness?",
  "Have I rejoined, circumstances of my neck, and my situation, but I am blind father, and drew an extreme debility",
  "I neither the torture and will be endured intense.",
  "It appeared affected me, and the heart was partly filled my mind; and busied herself to bestow as we approached the other branches of cousin.",
  "My feelings by amiable companions, fellow creatures; I perhaps never to physiology.",
  "Unless I fell dangerously ill. My father's house. The mountain, where no hope of the infidels.",
  "The modern system of them with a cheerful notes, whilst those I betook myself useful to my home, and were my only care.",
  "Pardon this he stepped aside and astonishment. The difference between the cottage and staircase.",
  "I feel the family is now became fainter as madness on his hand, cross my rage sparkled in the vengeance of De Lacey.",
  "He talked of his companions, continually on it, and we heard during the loathing and by the fire; then you will only hopes of men should you were deemed impassable, and they arrived at Chene, a thing seemed to it is well that cannot see a mystery.",
  "He was my conclusions. I walked for vivacity."
]
first_names = %w(Mary Ada Emma Lizzie Anne Sam Laura Simone Linnea Tove Astrid Karim Salma Silvia Jack)
last_names = %w(Shelley Lovelace Revan Austen Austin Astine Jansson Monet Lindgren Antilope Rodhe Bernadotte Winters Cervantes Osten)

movies = names.shuffle
movie_descriptions = descriptions.shuffle
directors_first = first_names.shuffle
directors_last = last_names.shuffle
directors = directors_first.map { |first| "#{first} #{directors_last.pop}"}

movies_listings = Movie.all

movies.length.times do |i|
  movie_hash = { type: "Movie", name: movies.pop, creator: directors.pop, description: movie_descriptions.pop, ranking: rand(0..100) }
  Movie.create(movie_hash)
end
