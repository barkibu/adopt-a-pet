require './db/migrate/20140917123136_create_shelters.rb'

class DropShelters < ActiveRecord::Migration
  def up
    CreateShelters.new.migrate(:down)
  end

  def down
    CreateShelters.new.migrate(:up)
  end
end
