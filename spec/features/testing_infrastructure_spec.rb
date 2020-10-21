feature 'testing infrastrucutre' do
  scenario 'Homepage is displayed' do
    visit('/')
    expect(page).to have_content('Diary')
  end 
end