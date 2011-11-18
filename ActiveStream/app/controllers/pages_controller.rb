class PagesController < ApplicationController
  before_filter :authenticate_user!, :only => :index
	layout 'application', :except => :promotion
  def home
		@title = "ActiveStream"
		
  end

  def about
		@title = "About A.S."
  end

  def contact
		@title = "Contact us"
  end

  def promotion
	@title = "Promotion"
    @a = 'bootstrap.css'
    @b = ''
    @c = ''
  end
  
  def holder
    @betasignup = Betasignups.new
    @a = 'main.css'
    @b = 'thickbox.css'
    @c = 'reset.css'
  end


  def create
    @betasignup = Betasignups.new(params[:betasignups])
    @a = 'main.css'
    @b = 'thickbox.css'
    @c = 'reset.css'

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

   def index
    @betasignups = Betasignups.all
    @a = 'main.css'
    @b = 'thickbox.css'
    @c = 'reset.css'
   end

  def success

    @a = 'main.css'
    @b = 'thickbox.css'
    @c = 'reset.css'
  end

end
