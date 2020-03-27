feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'Create User'
  end


  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
        fill_in "user[username]", with: "Jared"
        fill_in "user[password]", with: "123456"
        expect(page).to have_content 'Jared'
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
        fill_in "user[username]", with: "Jared"
        fill_in "user[password]", with: "123456"
        expect(page).to have_content 'Jared'
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end