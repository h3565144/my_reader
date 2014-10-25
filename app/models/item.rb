class Item < ActiveRecord::Base

  belongs_to :channel

  def rss_entry; @rss_entry ||= Feedjira::Parser::RSSEntry.parse(text) end


  #
  #search feature
  #
  include PgSearch
  pg_search_scope :search_by_text, against: :text

end
