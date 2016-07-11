# DB.define_column("users", "name", "string")
# DB.define_column("users", "email", "string")
# DB.define_column("users", "password", "string")
class User < ActiveRecord::Base
  include Errors

 # This sets the @errors Array to empty
 #
 # Returns an empty array
  def empty_errors
    @errors = []
  end
  
  # Returns @errors
  def user_exists
    if User.exists?(email: [self.email]) == true
      @errors << "An account already exists for this email address."
    end
  end

 # Adds errors to Array
 #
 # Returns Array
	def set_errors
  	if self.password == ""
    	@errors << "Must choose a password"
  	end
	end


# added weak password not tested
  def weakPassword
    if self.password.length < 8
      @errors << "Must choose a password with atleast 8 characters"
    end
  end







end