describe "the signin process" do
  it "signs me in and signs me out" do
    create(:user, :email => "user@example.com", :password => "1234567890")
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'user[email]', :with => 'user@example.com'
      fill_in 'user[password]', :with => '1234567890'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'

    click_link 'Log Out'
    expect(page).to have_content 'Signed out successfully'
  end
end