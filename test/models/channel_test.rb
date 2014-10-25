require 'test_helper'

class ChannelTest < ActiveSupport::TestCase

  test 'should fetch_items' do
    channel = create :channel, url: 'https://www.ruby-lang.org/en/feeds/news.rss'
    channel.fetch_items
    assert_equal channel.items.count, 10
    channel.fetch_items
    assert_equal channel.items.count, 10
  end

end
