class RenamePeopleToPerson < ActiveRecord::Migration
    def change
    	rename_table :people, :person
    end
end
