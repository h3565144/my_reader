require 'test_helper'

class ChannelsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create channel' do
    assert_difference('Channel.count') do
      post :create, channel: {url: 'https://www.ruby-lang.org/en/feeds/news.rss'}
    end

    assert_redirected_to reader_path
  end

  test 'should destroy channel' do
    channel = create :channel, url: 'https://www.ruby-lang.org/en/feeds/news.rss' 
    assert_difference('Channel.count', -1) do
      delete :destroy, id: channel
    end

    assert_redirected_to reader_path
  end
end
