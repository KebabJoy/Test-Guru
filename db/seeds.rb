# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create!([
                               { title: "computer science" },
                               { title: "chemistry" }
                               ])

users = User.create!([
                       { name: 'Bob' },
                       { name: 'Alice' }
                     ])

tests = Test.create!([
                      { title: "ICPC", level: 7, category: categories[0], author: users[1] },
                      { title: "MIPT olympiad", level: 4, category: categories[1], author: users[0] }
                      ])


questions = Question.create!([
                            { body: "The Knapsack problem", test_id: tests[0].id },
                            { body: "What color is NaOH?", test_id: tests[1].id  }
                            ])

