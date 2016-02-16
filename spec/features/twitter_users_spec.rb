require 'spec_helper'

describe 'twitter users pages', type: :feature do
  describe '/twitter_users/new' do
    before(:each) { visit '/twitter_users/new' }

    context 'when logged out' do
      it_redirects_to_log_in_page
    end

    context 'when logged in' do
      before { login }

      describe 'form' do
        it 'exists' do
          expect(page).to have_css 'form'
        end

        it 'has a twitter_user_screen_name text field' do
          expect(page).to have_css '#twitter_user_screen_name'
        end

        it 'has a submit button' do
          expect(page).to have_button 'Go to my feed'
        end

        context 'on submit' do
          before(:each){ submit_twitter_user_form }

          context 'when unique screen_name used' do
            it 'creates new twitter user' do
              expect(TwitterUser.count).to eq 1
            end

            it 'redirects to feeds page' do
              expect(current_path).to eq "/feed/#{TwitterUser.first.id}"
            end
          end

          context 'when non unique screen_name used' do
            before(:each) do
              visit '/'
              submit_twitter_user_form #again
            end

            it 'does not create new twitter user' do
              expect(TwitterUser.count).to eq 1
            end

            it 'redirects to feeds page' do
              expect(current_path).to eq "/feed/#{TwitterUser.first.id}"
            end
          end
        end
      end
    end
  end
end
