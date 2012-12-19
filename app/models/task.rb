require 'atom'
class Task < ActiveRecord::Base
  attr_accessible :name

  def to_atom
  	
  end
end
