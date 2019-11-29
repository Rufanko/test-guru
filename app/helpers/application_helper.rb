module ApplicationHelper
	
	def thinknetica
	  link_to 'Учебный проект в онлайн-школе Thinknetica', 'thinknetica.com'
	end

	def current_year
	  Time.current.year
	end

	def my_name
	  'Rufan Mamedov'
	end

	def my_git
	  'Rufanko'
	end

	def my_repo
	  'RubyOnRails'
	end

	def github_link(author, repo)
	link_to 'Github Link', "https://github.com/#{author}/#{repo}"
	end

end
