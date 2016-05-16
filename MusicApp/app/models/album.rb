class Album < ActiveRecord::Base
   belongs_to :band
   has_many :tracks
   validates :album_type, inclusion: { in: %w(studio live)}
end
