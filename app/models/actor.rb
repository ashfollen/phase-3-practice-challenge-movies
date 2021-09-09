class Actor < ActiveRecord::Base
    has_many :roles
    has_many :movies, through: :roles
    
    # my solution - works 
    # def total_salary
    #     self.roles.sum(:salary)
    # end

    # Marc's solution
    def total_salary
        self.roles.sum(&:salary)
    end

    def blockbusters
        self.movies.find_each do |movie|
            movie.where("box_office_earnings > ?", 50000000)
        end 
    end
    
    # my solution - not finished
    # def self.most_successful
    #     actor_list = self.all.map do |actor|
    #         actor.total_salary
    #     end        
    # end

    # Marc's solution
    def self.most_successful
        Actor.all.sort_by {|actor| actor.total_salary}.last 
        
    end
end