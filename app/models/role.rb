class Role < ActiveRecord::Base
    belongs_to :movie
    belongs_to :actor 

    def credit 
        "#{self.character_name}: Played by #{actor.name}"
    end
end