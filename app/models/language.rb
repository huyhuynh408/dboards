class Language < ActiveRecord::Base
  has_many :codings
  has_many :entries, through: :codings
end
