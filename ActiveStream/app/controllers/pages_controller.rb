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

    if @betasignup.save 
      flash[:success] = "Sign Up Success!"
      redirect_to '/success'
    else 
      flash[:failure] = "Oops, please check your name or password."
      render 'holder'
    end
  end

end
