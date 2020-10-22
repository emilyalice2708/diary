feature 'adding entries' do
  scenario 'user can add new entry' do
    visit('/diary/new')
    fill_in('entry', with: "It has been a very long day")
    fill_in('title', with: "Lonely Friday")
    click_button "Add"

    expect(page).to have_content 'Lonely Friday' 
    expect(page).to have_content 'It has been a very long day'
  end
end