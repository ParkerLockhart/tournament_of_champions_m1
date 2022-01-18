# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
competition_1 = Competition.create(name: "Mens Regional", location: "Louisville", sport: "basketball")
competition_2 = Competition.create(name: "Womens State", location: "Deerfield", sport: "powerlifting")

team_1 = competition_1.teams.create(nickname: "Rockets", hometown: "Leesburg")
team_2 = competition_1.teams.create(nickname: "Badgers", hometown: "Springfield")

team_3 = competition_2.teams.create(nickname: "Stars", hometown: "Deerfield")

player_1 = team_1.players.create(name: "Joe", age: 22)
player_2 =team_1.players.create(name: "Rob", age: 21)
player_3 = team_2.players.create(name: "Tim", age: 24)
player_4 = team_2.players.create(name: "Sam", age: 23)
