class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :notes

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes_contents=(arr)
    contents.each do |content|
      if content.strip != ""
         self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end

end
