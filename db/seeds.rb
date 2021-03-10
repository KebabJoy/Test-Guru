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
                       { email: 'son@mail.ru', password: '123456', password_confirmation: '123456' }
                     ])

tests = Test.create!([
                      { title: "ICPC", level: 7, category: categories[0], author: users[1] },
                      { title: "MIPT olympiad", level: 4, category: categories[1], author: users[0] },
                      { title: "Backend", level: 1, category: categories[0], author: users[0] }
                      ])


questions = Question.create!([
                            { body: "The Knapsack problem", test_id: tests[0] },
                            { body: "What color is NaOH?", test_id: tests[1]  },
                            { body: "What is dp[i][j]?", test_id: tests[0]  },
                            { body: "What is dfs?", test_id: tests[0]  },
                            { body: "Which language is used to build this app?", test_id: tests[2]  },
                            { body: "What is database?", test: tests[2]  }
                            ])


Answer.create!([
                { title: "some code", correct: true, question: questions[0]},
                { title: "4", question: questions[0] },
                { title: "Maximum value", correct: true, question: questions[2] },
                { title: "Nothing", question: questions[2] },
                { title: "Ruby", correct: true, question: questions[4] },
                { title: "C#", question: questions[4] },
                { title: "Struct to save data", correct: true, question: questions[5] },
                { title: "Language", question: questions[5] },
                { title: "White", correct: true, question: questions[1] }
               ])


Badge.create!([
                { name: "1st try success", img_url: "https://png.pngtree.com/element_our/sm/20180602/sm_5b12bb7c33539.jpg",
                  rule: Badge.rules.key(0) },
                { name: "All tests of a lvl", img_url: "https://cdn4.iconfinder.com/data/icons/badges-9/66/31-512.png",
                  rule: Badge.rules.key(1), rule_value: tests[0].level },
                { name: "All tests of a lvl", img_url: "https://cdn.imgbin.com/14/19/3/imgbin-computer-icons-achievement-learning-from-other-8ZG28U9JiQAAFXdAQRwA5xQcK.jpg",
                  rule: Badge.rules.key(2), rule_value: categories[0].id }
              ])
