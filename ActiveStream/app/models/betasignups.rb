class Betasignups < ActiveRecord::Base

  attr_accessible :username, :email

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username,  :presence   => true,
              :length     => { :maximum => 50},
          :uniqueness => true

  validates :email, :presence   => true,
          :format     => { :with => email_regex}, 
          :uniqueness => { :case_sensitive => false}
end
