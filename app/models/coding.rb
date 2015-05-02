class Coding < ActiveRecord::Base
  belongs_to :language
  belongs_to :entry
end
