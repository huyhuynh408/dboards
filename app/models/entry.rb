class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :cohort
  belongs_to :phase
end
