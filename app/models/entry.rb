class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :cohort
  belongs_to :phase
  belongs_to :bookmarking
  has_many   :codings
  has_many   :languages, through: :codings
end
