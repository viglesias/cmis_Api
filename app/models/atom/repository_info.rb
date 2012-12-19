module Atom
	class RepositoryInfo
		include Xml::Parseable
    include SimpleExtensions
    extend Forwardable
    def_delegators :@links, :alternate, :self, :alternates, :enclosures, :edit_link, :via
    
    loadable!
    namespace "http://docs.oasis-open.org/ns/cmis/restatom/200908/"
    element :repositoryId, :repositoryName, :repositoryDescription, :vendorName, :productName, :productVersion, :rootFolderId
    element :cmisVersionSupported, :cmisSpecificationTitle
    element :updated, :published, :class => Time, :content_only => true
    element :source, :class => Source
    elements :links
    elements :authors, :contributors, :class => Person
    elements :categories, :class => Category
    element :content, :class => Content
    elements :entries
	  elements :collections    
    elements :capabilities
    element :repositoryURL

        
    # Initialize an Entry.
    #
    # This will also yield itself, so an Entry can be constructed like this:
    #
    #   entry = Entry.new do |entry|
    #     entry.title = "My Cool entry"
    #   end
    # 
    # +o+:: An XML Reader or a Hash of attributes.
    #
    def initialize(o = {})
      @links = Links.new
      @authors = []
      @contributors = []
      @categories = []
      case o
      when XML::Reader        
        if current_node_is?(o, 'entry', Atom::NAMESPACE) || next_node_is?(o, 'entry', Atom::NAMESPACE)
          o.read
          parse(o)
        else
          raise ArgumentError, "Entry created with node other than atom:entry: #{o.name}"
        end
      when Hash
        o.each do |k,v|
          send("#{k.to_s}=", v)
        end
      else
        raise ArgumentError, "Got #{o.class} but expected a Hash or XML::Reader"
      end

      yield(self) if block_given?
    end   
    
    # Reload the Entry by fetching the self link.
    def reload!(opts = {})
      if links.self
        Entry.load_entry(URI.parse(links.self.href), opts)
      end
    end
	end
end