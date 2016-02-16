require 'spec_helper'

describe 'twitter users pages', type: :feature do
  before { visit '/' }

  xcontext 'while not logged in' do
    it 'redirects to sign_in page' do
      expect(current_path).to eq '/sign_in'
    end
  end

  describe '/twitter_users/new' do
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

      xcontext 'on submit' do
        it 'redirects to feeds page' do
        end
      end
    end
  end
end
