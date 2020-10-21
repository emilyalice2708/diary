feature 'viewing entries' do
  scenario 'user can view diary entries' do
    visit('/entries')
    expect(page).to have_content("Entry 1: Dear Diary")
    expect(page).to have_content("Entry 2: Dear Diary")
  end
end