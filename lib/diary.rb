require 'pg'

class Diary
  attr_reader :id, :title, :entry

  def initialize(id:, title:, entry:)
    @id = id
    @title = title
    @entry = entry
  end

  def self.view_all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'diary_manager_test'
    else
      connection = PG.connect :dbname => 'diary_manager'
    end

    result = connection.exec "SELECT * FROM diary"
    result.map do |diary|
      Diary.new(id: diary['id'], title: diary['title'], entry: diary['entry'])
    end
  end

  def self.add(title:, entry:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'diary_manager_test'
    else
      connection = PG.connect :dbname => 'diary_manager'
    end

    result = connection.exec("INSERT INTO diary (title, entry) VALUES('#{title}', '#{entry}') RETURNING id, title, entry;")
    Diary.new(id: result[0]['id'], title: result[0]['title'], entry: result[0]['entry'])
  end
end