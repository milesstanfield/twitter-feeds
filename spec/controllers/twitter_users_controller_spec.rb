describe TwitterUsersController, type: :controller do
  context 'when logged out' do
    describe '#new' do
      it 'renders new template' do
        get :new
        expect(response).to redirect_to '/users/sign_in'
      end
    end

    describe '#create' do
      it 'redirects to feed' do
        params = {twitter_user: {screen_name: 'MilesUA'}}
        post :create, params
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  context 'when logged in' do
    before(:each){ sign_in :user, FactoryGirl.create(:user) }

    describe '#new' do
      it 'renders new template' do
        twitter_user = double(:twitter_user)
        expect(TwitterUser).to receive(:new).and_return(twitter_user)
        get :new
        expect(response).to render_template :new
        expect(assigns(:twitter_user)).to eq twitter_user
      end
    end

    describe '#create' do
      it 'redirects to feed' do
        twitter_user = FactoryGirl.create(:twitter_user)
        params = {twitter_user: {screen_name: 'MilesUA'}}
        expect(TwitterUser).to receive(:first_or_create).with(params[:twitter_user]).and_return(twitter_user)
        post :create, params
        expect(assigns(:twitter_user)).to eq twitter_user
        expect(response).to redirect_to "/feed/#{twitter_user.id}"
      end
    end
  end
end
