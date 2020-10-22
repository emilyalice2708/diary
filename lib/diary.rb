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

  def self.add(entry)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect :dbname => 'diary_manager_test'
    else
      connection = PG.connect :dbname => 'diary_manager'
    end

    connection.exec("INSERT INTO diary (entry) VALUES('#{entry}');")
  end
end