require 'diary'

describe Diary do
  subject(:diary) { Diary }

  describe '.view_all' do
    it 'returns list of diary entries' do
      connection = PG.connect :dbname => 'diary_manager_test'
      connection.exec("INSERT INTO diary (entry) VALUES('Entry 1: Dear Diary')")
      connection.exec("INSERT INTO diary (entry) VALUES('Entry 2: Dear Diary')")

      expect(diary.view_all).to include("Entry 1: Dear Diary")
      expect(diary.view_all).to include("Entry 2: Dear Diary")
    end
  end

  describe '.add' do
    it 'adds an entry to the database' do
      diary.add("The week is flying by.")
      expect(diary.view_all).to include("The week is flying by.")
    end
  end
end