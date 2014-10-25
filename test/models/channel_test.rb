require 'test_helper'

class ChannelTest < ActiveSupport::TestCase

  test 'should fetch_items' do
    # channel = create :channel, url: 'https://www.ruby-lang.org/en/feeds/news.rss'
    channel = create :channel, url: 'http://news.163.com/special/00011K6L/rss_gj.xml'
    channel.fetch_items
    assert channel.items.count, 50
    channel.fetch_items
    assert channel.items.count, 50
  end

end
