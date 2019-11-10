# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{name:'Ruby'},
                 {name:'Rails'},
                 {name:'HTML'},
                 {name:'CSS'},
             	 {name:'Javascript'}])
users = User.create!([{name: 'Ivan'},
              {name: 'Oleg'},
              {name: 'Natalya'},
              {name: 'Vasiliy'}])
tests = Test.create!([{title:'RoR', level:3, categories_id: categories.second.id, users_id: users.first.id},
			  {title:'RoR', level:5, categories_id: categories.second.id, users_id: users.first.id},
			  {title:'RoR', level:10, categories_id: categories.second.id, users_id: users.first.id},
	          {title:'Javascript', level:7, categories_id: categories.fifth.id, users_id: users.third.id},
	          {title:'Javascript', level:6, categories_id: categories.fifth.id, users_id: users.third.id},
	          {title:'Ruby basics', level:2, categories_id: categories.first.id, users_id: users.first.id},
	          {title:'Ruby basics', level:2, categories_id: categories.first.id, users_id: users.first.id},
	          {title:'HTML', level:9, categories_id: categories.third.id, users_id: users.second.id},
	          {title:'CSS', level:8, categories_id: categories.fourth.id, users_id: users.fourth.id}])
questions = Question.create!([{content:'text', tests_id: tests.first.id},
				 {content:'text', tests_id: tests.second.id},
			     {content:'text', tests_id: tests.third.id}])
answers = Answer.create!([{correct:true, content: 'text', questions_id: questions.first.id},
				         {correct:false, content: 'text', questions_id: questions.second.id}])
usertests = UserTests.create! [{users_id: users.first.id, tests_id: tests.second.id},
                   {users_id: users.second.id,tests_id: tests.third.id},
                   {users_id: users.third.id, tests_id: tests.first.id},
                   {users_id: users.first.id, tests_id: tests.first.id}]