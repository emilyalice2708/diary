feature 'viewing entries' do
  scenario 'user can view diary entries' do
    Diary.add(title: "First Entry", entry: "Entry 1: Dear Diary")
    Diary.add(title: "Second Entry", entry: "Entry 2: Dear Diary")

    visit('/diary/entries')

    expect(page).to have_content("First Entry")
    expect(page).to have_content("Entry 1: Dear Diary")
    expect(page).to have_content("Second Entry")
    expect(page).to have_content("Entry 2: Dear Diary")
  end
end