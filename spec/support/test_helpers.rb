module TestHelpers
  def login(user = FactoryGirl.create(:user))
    visit '/users/sign_in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  def it_redirects_to_log_in_page
    it 'redirects to login page' do
      expect(current_path).to eq '/users/sign_in'
    end
  end

  def submit_twitter_user_form
    fill_in 'twitter_user_screen_name', with: 'MilesUA'
    click_button 'Go to my feed'
  end
end
