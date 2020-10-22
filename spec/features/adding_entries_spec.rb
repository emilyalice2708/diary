feature 'adding entries' do
  scenario 'user can add new entry' do
    visit('/diary/new')
    fill_in('entry', with: "It has been a very long day")
    click_button "Add"

    expect(page).to have_content 'It has been a very long day'
  end
end