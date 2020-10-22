feature 'testing infrastrucutre' do
  scenario 'Homepage is displayed' do
    visit('/diary')
    expect(page).to have_content('Diary')
  end 
end