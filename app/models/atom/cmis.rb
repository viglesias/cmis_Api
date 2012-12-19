
module Atom
	class Cmis < Feed
		include Xml::Parseable
	    include SimpleExtensions
	    extend Forwardable
	    def_delegators :@links, :alternate, :self, :via, :first_page, :last_page, :next_page, :prev_page

	    loadable! 
	    
	    namespace "http://www.w3.org/2007/app"
	    element :id, :rights
	    element :generator, :class => Generator
	    element :title, :subtitle, :class => Content
	    element :updated, :class => Time, :content_only => true
	    elements :links
	    elements :authors, :contributors, :class => Person
	    elements :categories
	    elements :workspaces
	    elements :entries
	    elements :collections
	    elements :repositories
	    
	    # Initialize a Feed.
	    #
	    # This will also yield itself, so a feed can be constructed like this:
	    #
	    #   feed = Feed.new do |feed|
	    #     feed.title = "My Cool feed"
	    #   end
	    # 
	    # +o+:: An XML Reader or a Hash of attributes.
	    #
	    def initialize(o = {})
	      @links, @collections, @entries, @authors, @contributors, @categories = Links.new, [], [], [], [], []
	      
	      case o
	      when XML::Reader
	        if next_node_is?(o, 'feed', Atom::NAMESPACE)
	          o.read
	          parse(o)
	        else
	          raise ArgumentError, "XML document was missing atom:feed: #{o.read_outer_xml}"
	        end
	      when Hash
	        o.each do |k, v|
	          self.send("#{k.to_s}=", v)
	        end
	      else
	        raise ArgumentError, "Got #{o.class} but expected a Hash or XML::Reader"
	      end
	      
	      yield(self) if block_given?
	    end
	    
	    # Return true if this is the first feed in a paginated set.
	    def first?
	      links.self == links.first_page
	    end 
	    
	    # Returns true if this is the last feed in a paginated set.
	    def last?
	      links.self == links.last_page
	    end
	    
	    # Reloads the feed by fetching the self uri.
	    def reload!(opts = {})
	      if links.self
	        Feed.load_feed(URI.parse(links.self.href), opts)
	      end
	    end
	    
	    # Iterates over each entry in the feed.
	    #
	    # ==== Options
	    #
	    # +paginate+::  If true and the feed supports pagination this will fetch each page of the feed.
	    # +since+::     If a Time object is provided each_entry will iterate over all entries that were updated since that time.
	    # +user+::      User name for HTTP Basic Authentication.
	    # +pass+::      Password for HTTP Basic Authentication.
	    #
	    def each_entry(options = {}, &block)
	      if options[:paginate]
	        since_reached = false
	        feed = self
	        loop do          
	          feed.entries.each do |entry|
	            if options[:since] && entry.updated && options[:since] > entry.updated
	              since_reached = true
	              break
	            else
	              block.call(entry)
	            end
	          end
	          
	          if since_reached || feed.next_page.nil?
	            break
	          else feed.next_page
	            feed = feed.next_page.fetch(options)
	          end
	        end
	      else
	        self.entries.each(&block)
	      end
	    end	   
	end
end