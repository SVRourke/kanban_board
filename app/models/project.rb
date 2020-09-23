class Project < ActiveRecord::Base
    validates :title, uniqueness: {message: "Project %{value} Already Exists!"}
    validates :title, presence: {message: "Project Must Have A Title!"}
    validates :description, presence: {message: "Project Must Have A Description!"}

    belongs_to :user
    has_many :tasks
end
