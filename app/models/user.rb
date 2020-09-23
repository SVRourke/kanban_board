class User < ActiveRecord::Base
    has_secure_password
    validates :username, uniqueness: {message: "Username Already Taken!"}
    validates :email, uniqueness: {message: "Email Already In Use!"}
    validates :password, length: {minimum: 5, message: "Password Must Be Longer Than 5 Characters!"}

    has_many :projects
    has_many :tasks, through: :projects
end
