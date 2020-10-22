require 'diary'

describe Diary do
  subject(:diary) { Diary }

  describe '.view_all' do
    it 'returns list of diary entries' do
      connection = PG.connect :dbname => 'diary_manager_test'

      new_entry = Diary.add(title: "First Entry", entry: "Dear Diary")
      Diary.add(title: "Second Entry", entry: "Dear Diary")

      diary_log = Diary.view_all

      expect(diary_log.length).to eq 2
      expect(diary_log.first).to be_a Diary
      expect(diary_log.first.id). to eq new_entry.id
      expect(diary_log.first.title).to eq "First Entry"
      expect(diary_log.first.entry).to eq "Dear Diary"
    end
  end

  describe '.add' do
    it 'adds an entry to the database' do
      new_entry = diary.add(title: "Epic Thursday", entry: "The week is flying by.")
      data = PG.connect(:dbname => 'diary_manager_test').query("SELECT * FROM diary WHERE id = #{new_entry.id};")

      expect(new_entry).to be_a Diary
      expect(new_entry.title).to eq "Epic Thursday"
      expect(new_entry.entry).to eq "The week is flying by."
      expect(new_entry.id).to eq data.first['id']
    end
  end
end