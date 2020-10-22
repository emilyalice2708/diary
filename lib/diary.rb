require 'pg'

class Diary
  def self.view_all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect :dbname => 'diary_manager_test'
    else
      connection = PG.connect :dbname => 'diary_manager'
    end
    result = connection.exec "SELECT entry FROM diary"
    result.map { |row| row['entry'] }
  end
end