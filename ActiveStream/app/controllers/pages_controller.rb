class PagesController < ApplicationController
  def home
		@title = "ActiveStream"
  end

  def about
		@title = "About A.S."
  end

  def contact
		@title = "Contact us"
  end

end
