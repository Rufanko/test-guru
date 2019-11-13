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
tests = Test.create!([{title:'RoR test for begginers', level:3, category_id: categories.second.id, user_id: users.first.id, author_id: users[4]},
			  {title:'RoR  intermediate test', level:5, category_id: categories.second.id, user_id: users.first.id, author_id: users[4]},
			  {title:'RoR test for experts', level:10, category_id: categories.second.id, user_id: users.first.id, author_id: users[4]},
	          {title:'Javascript intermediate test', level:7, category_id: categories.fifth.id, user_id: users.third.id, author_id: users[4]},
	          {title:'Javascript test for beginners', level:2, category_id: categories.fifth.id, user_id: users.third.id, author_id: users[4]},
	          {title:'Ruby basics', level:1, category_id: categories.first.id, user_id: users.first.id, author_id: users[4]},
	          {title:'Ruby test for begginers', level:3, category_id: categories.first.id, user_id: users.first.id, author_id: users[4]},
	          {title:'HTML advanced test', level:9, category_id: categories.third.id, user_id: users.second.id, author_id: users[4]},
	          {title:'CSS advanced test', level:8, category_id: categories.fourth.id, user_id: users.fourth.id, author_id: users[4]}])
questions = Question.create!([{content:'text', test_id: tests.first.id},
				 {content:'text', test_id: tests.second.id},
			     {content:'text', test_id: tests.third.id}])
answers = Answer.create!([{correct:true, content: 'text', question_id: questions.first.id},
				         {correct:false, content: 'text', question_id: questions.second.id}])
usertests = TestsUser.create! [{user_id: users.first.id, test_id: tests.second.id},
                   {user_id: users.second.id,test_id: tests.third.id},
                   {user_id: users.third.id, test_id: tests.first.id},
                   {user_id: users.first.id, test_id: tests.first.id}]
                   