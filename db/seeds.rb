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
                       { email: 'qwer@mail.ru', password: 'qwerty', password_confirmation: 'qwerty' },
                       { email: 'son@mail.ru', password: '123456', password_confirmation: '123456'}
                     ])

tests = Test.create!([
                      { title: "ICPC", level: 7, category: categories[0], author: users[1] },
                      { title: "MIPT olympiad", level: 4, category: categories[1], author: users[0] }
                      ])


questions = Question.create!([
                            { body: "The Knapsack problem", test_id: tests[0].id },
                            { body: "What color is NaOH?", test_id: tests[1].id  }
                            ])


Answer.create!([
                { title: "some code", correct: true, question: questions[0]},
                { title: "4", question: questions[0] },
                { title: "White", correct: true, question: questions[1] }
               ])


Badge.create!([
                { name: "1st try success", img_url: "https://png.pngtree.com/element_our/sm/20180602/sm_5b12bb7c33539.jpg",
                  rule: Badge::RULES.first },
                { name: "All tests of a lvl", img_url: "https://cdn4.iconfinder.com/data/icons/badges-9/66/31-512.png",
                  rule: Badge::RULES[1] },
                { name: "All tests of a lvl", img_url: "https://cdn.imgbin.com/14/19/3/imgbin-computer-icons-achievement-learning-from-other-8ZG28U9JiQAAFXdAQRwA5xQcK.jpg",
                  rule: Badge::RULES[2] }
              ])
