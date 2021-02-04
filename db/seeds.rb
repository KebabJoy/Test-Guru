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
                      { title: "ICPC", level: 7, category_id: categories[0].id, author_id: users[1].id },
                      { title: "MIPT olympiad", level: 4, category_id: categories[1].id, author_id: users[0].id }
                      ])


questions = Questions.create!([
                            { body: "The Knapsack problem", test_id: tests[0].id },
                            { body: "What color is NaOH?", test_id: tests[1].id  }
                            ])

answers = Answer.create!([
                          { title: "some code", correct: true, questions_id: questions[0].id},
                          { title: "4", questions_id: questions[0].id },
                          { title: "White", correct: true, questions_id: questions[1].id }
                         ])

user_tests = UserTest.create!([
                               { user_id: 1, test_id: tests[1].id },
                               { user_id: 2, test_id: tests[0].id }
                               ])
