# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@gmail',
   password: '123456',
)

initial_genres = [
  {name: "ダイエット"},
  {name: "誰でも歓迎"},
  {name: "30代トレーニー"},
  {name: "40代トレーニー"},
  {name: "女性トレーニー"}
]
Genre.create(initial_genres)