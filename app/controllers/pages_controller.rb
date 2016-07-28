class PagesController < ApplicationController
	def home
		@texts = Texts.all.reverse
		@text = Texts.new
	end

	def save
		@text = Texts.new(texts_params)
		if @text[:content].length != 0
			a = @text[:content].delete(".(),").split(' ')
			b = a.uniq
			h = {}
			b.each { |x| h[x] = a.count(x)}
			@text[:top3] = h.sort_by {|k,v| v}.reverse[0, 3].to_h.to_json
			@text.save
		end
		redirect_to "/"
	end

	def destroy
		@texts = Texts.all
		@texts.delete_all
		redirect_to "/"
	end

	private
	def texts_params
		params.require(:texts).permit(:content)
	end
end
