class Task < ActiveRecord::Base
    validates :content, uniqueness: {message: "Task already in project!"}
    validates :content, presence: {message: "Cannot Save Blank Task!"}

    belongs_to :user
    belongs_to :project
end
