class User < ActiveRecord::Base
  attr_accessible :email, :mobile, :password, :username
end
