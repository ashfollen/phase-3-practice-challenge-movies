class Movie < ActiveRecord::Base
    has_many :roles
    has_many :actors, through: :roles

    def cast_role(actor, character_name, salary)
        Role.create(movie_id: self.id, actor_id: actor.id, character_name: character_name, salary: salary)
    end

    def all_credits 
        self.roles.map do |role|
            role.credit
        end 
    end 
    
    # my solution - didn't persist 
    # def fire_actor(actor)
    #     fired_actor = self.actors.find_by(id: actor.id)
    #     fired_role = fired_actor.roles
    #     fired_role.destroy
    # end

    # Marc's solution
    def fire_actor(actor)
        role = self.roles.find_by_actor_id(actor.id)
        if role 
            role.destroy
        end 
    end
end