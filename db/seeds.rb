# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Test.create([{title:'RoR', level:3},
			  {title:'RoR', level:5},
			  {title:'RoR', level:10},
	          {title:'Javascript', level:7},
	          {title:'Javascript', level:6},
	          {title:'Ruby basics', level:2},
	          {title:'Ruby basics', level:2},
	          {title:'HTML', level:9},
	          {title:'CSS', level:8}])
Category.create([{name:'Ruby'},
                 {name:'Rails'},
                 {name:'HTML'},
                 {name:'CSS'},
             	 {name:'Javascipt'}])
Answer.create([{correct:true},
				{correct:false}])
Question.create([{content:'text'},
				 {content:'text'},
			     {content:'text'}])
User.create([{name: 'Ivan'},
              {name: 'Oleg'},
              {name: 'Natalya'},
              {name: 'Vasiliy'}])