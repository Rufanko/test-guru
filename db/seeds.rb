# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ name: 'Ruby' },
                               { name: 'Rails' },
                               { name: 'HTML' },
                               { name: 'CSS' },
                               { name: 'Javascript' }])
users = User.create!([{ name: 'Ivan', email: 'Ivan1337@mail.ru' },
                      { name: 'Oleg', email: 'Oleg1978@mail.ru' },
                      { name: 'Natalya', email: 'Nata92@mail.ru' },
                      { name: 'Vasiliy', email: 'vasiliyinbusinnes@mail.ru' }])
tests = Test.create!([{ title: 'RoR test for begginers', level: 3, category: categories[2], author: users[3] },
                      { title: 'RoR  intermediate test', level: 5, category: categories[2], author: users[3] },
                      { title: 'RoR test for experts', level: 10, category: categories[2], author: users[3] },
                      { title: 'Javascript intermediate test', level: 7, category: categories[4], author: users[3] },
                      { title: 'Javascript test for beginners', level: 2, category: categories[4], author: users[3] },
                      { title: 'Ruby basics', level: 1, category: categories[0], author: users[3] },
                      { title: 'Ruby test for begginers', level: 4, category: categories[0], author: users[3] },
                      { title: 'HTML advanced test', level: 9, category: categories[2], author: users[3] }])
questions = Question.create!([{ content: 'text', test: tests[4] },
                              { content: 'text', test: tests[5] },
                              { content: 'text', test: tests[2] }])
answers = Answer.create!([{ correct: true, content: 'text', question: questions[2] },
                          { correct: false, content: 'text', question: questions[1] }])

