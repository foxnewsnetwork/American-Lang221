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
  
  def holder
    @betasignup = Betasignups.new
  end


  def create
    @betasignup = Betasignups.new(params[:betasignups])
	
    if request.xhr?
      puts 'xhr request'
    end

    if @betasignup.save 
      flash[:success] = "Sign Up Success!"
    else
      flash[:failure] = "Failure Failed!"
    end

    respond_to do |format|
      format.html { redirect_to '/' }
      format.js
    end

  end

  def success
  end

end
