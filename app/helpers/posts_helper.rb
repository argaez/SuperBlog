module PostsHelper

	def form_title

		@post.new_record? ? "Publica un nuevo Post" : "Modifica este Post"

	end

end
