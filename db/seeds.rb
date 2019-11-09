# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Test.create([{title:'RoR', level:3, category_id: Category.find_by(name: 'Rails').id},
			  {title:'RoR', level:5, category_id: Category.find_by(name: 'Rails').id},
			  {title:'RoR', level:10, category_id: Category.find_by(name: 'Rails').id},
	          {title:'Javascript', level:7, category_id: Category.find_by(name: 'Javascript').id},
	          {title:'Javascript', level:6, category_id: Category.find_by(name: 'Javascript').id},
	          {title:'Ruby basics', level:2, category_id: Category.find_by(name: 'Ruby').id},
	          {title:'Ruby basics', level:2, category_id: Category.find_by(name: 'Ruby').id},
	          {title:'HTML', level:9, category_id: Category.find_by(name: 'HTML').id},
	          {title:'CSS', level:8, category_id: Category.find_by(name: 'CSS').id}])
Category.create([{name:'Ruby'},
                 {name:'Rails'},
                 {name:'HTML'},
                 {name:'CSS'},
             	 {name:'Javascript'}])
Answer.create([{correct:true},
				{correct:false}])
Question.create([{content:'text'},
				 {content:'text'},
			     {content:'text'}])
User.create([{name: 'Ivan'},
              {name: 'Oleg'},
              {name: 'Natalya'},
              {name: 'Vasiliy'}])
UsersTest.create([{user_id: user.first.id, test_id: tests.second.id},
              {user_id: user.second.id,test_id: tests.third.id},
              {user_id: user.third.id,test_id: tests.first.id},
              {user_id: user.first.id,test_id: tests.first.id}])