class Item < ActiveRecord::Base

  belongs_to :channel

  def parsed_item; @parsed_item ||= Feedjira::Parser::RSSEntry.parse(text) end


  #
  #search feature
  #
  include PgSearch
  pg_search_scope :search_by_text, against: :text

end
