require 'pg'

class Diary
  def self.view_all
    connection = PG.connect :dbname => 'diary_manager'
    result = connection.exec "SELECT entry FROM diary"
    result.map { |row| row['entry'] }
  end
end