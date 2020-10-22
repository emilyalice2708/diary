feature 'viewing entries' do
  scenario 'user can view diary entries' do
    connection = PG.connect :dbname => 'diary_manager_test'
    connection.exec("INSERT INTO diary (entry) VALUES('Entry 1: Dear Diary')")
    connection.exec("INSERT INTO diary (entry) VALUES('Entry 2: Dear Diary')")
      
    visit('/diary/entries')
    expect(page).to have_content("Entry 1: Dear Diary")
    expect(page).to have_content("Entry 2: Dear Diary")
  end
end