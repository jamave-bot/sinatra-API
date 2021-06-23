class User < ActiveRecord::Base
    has_many :workouts
    has_many :exercises, through: :workouts

    def professor_name
        "Dr. #{name}"
    end

end