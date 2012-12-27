# encoding: utf-8
require 'atom'
require 'atom/pub'

module Api
	class RepositoriesController < ApplicationController
		#include ActionController::HttpAuthentication::Token::ControllerMethods
		#before_filter :restrict_access
		include ActionController::HttpAuthentication::Basic::ControllerMethods
		include ActionController::MimeResponds             
		#http_basic_authenticate_with :name => "admin", :password => "admin"
		
		def index			
 			 cmis = Atom::Cmis.new			  
			  Atom::Cmis.add_extension_namespace :app, "http://www.w3.org/2007/app"
			  Atom::Cmis.add_extension_namespace :atom, "http://www.w3.org/2005/Atom"
			  Atom::Cmis.add_extension_namespace :cra, "http://docs.oasis-open.org/ns/cmis/restatom/200908/"
			  Atom::Cmis.add_extension_namespace :c, "http://docs.oasis-open.org/ns/cmis/core/200908/"	
			  Atom::Cmis.add_extension_namespace :cm, "http://docs.oasis-open.org/ns/cmis/messaging/200908/"				  
			  Atom::Cmis.add_extension_namespace :alf, "http://www.alfresco.org"			  
			  cmis.workspaces << Atom::Workspace.new do |w|
			  	 repositoryInfo = Atom::RepositoryInfo.new do |f|
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryId"] << "af0e3a5a-628f-41a5-8a82-75006933331d"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryName"] << "Nombre del repositorio 1 "
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryURL"] << "urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af7"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","cmisVersionSupported"] << "1.0"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryDescription"] << "Descripción repositorio 1"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","vendorName"] << "Vendorname repositorio 1"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","productName"] << "ProductName repositorio 1"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","vendorName"] << "Vendorname repositorio 1"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","productVersion"] << "Vendorname repositorio 1"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","rootFolderId"] << "http://localhost:3000/api/cmis/rootFolder/1"
			  	  	f.capabilities << Atom::Capability.new do |c|
			  	  		c.capabilityACL = "CapabilityACL "
			  	  		c.capabilityAllVersionsSearchable = "bíusquedas por Capability"
			  	  		c.capabilitychanges = "Cambios en capability"
			  	  		c.capabilityContentStreamUpdatability = "capabilityContentStreamActualización"
			  	  		c.capabilitygetDescendants = "Hijos capability"
      					c.capabilityGetFolderTree = "Obtener arbol de directorios"
      					c.capabilityMultifiling = "Multifiling"
      					c.capabilityPWCSearchable = "PWC Sercheable"
      					c.capabilityPWCUpdatable = "POCUpdatable"
      					c.capabilityQuery = "Query"
      					c.capabilityRenditions = "Capability Redention"
      					c.capabilityUnfiling = "Unifiling"
      					c.capabilityVersionSpecificFiling = "Version specific"
      					c.capabilityJoin = "Capability Join"
			  	  	end
			  	 end
			  	w.repositoryInfo << repositoryInfo
			  	repositoryInfo = Atom::RepositoryInfo.new do |f|
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryId"] << "af0e3a5a-628f-41a5-8a82-75006933331c"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryName"] << "Nombre del repositorio 2"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryURL"] << "urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af8"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","cmisVersionSupported"] << "1.0"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryDescription"] << "Descripción repositorio 2"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","vendorName"] << "Vendorname repositorio 2"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","productName"] << "ProductName repositorio 2"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","vendorName"] << "Vendorname repositorio 2"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","productVersion"] << "Vendorname repositorio 2"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","rootFolderId"] << "http://localhost:3000/api/cmis/rootFolder/2"
			  	  	f.capabilities << Atom::Capability.new do |c|
			  	  		c.capabilityACL = "CapabilityACL "
			  	  		c.capabilityAllVersionsSearchable = "bíusquedas por Capability"
			  	  		c.capabilitychanges = "Cambios en capability"
			  	  		c.capabilityContentStreamUpdatability = "capabilityContentStreamActualización"
			  	  		c.capabilitygetDescendants = "Hijos capability"
      					c.capabilityGetFolderTree = "Obtener arbol de directorios"
      					c.capabilityMultifiling = "Multifiling"
      					c.capabilityPWCSearchable = "PWC Sercheable"
      					c.capabilityPWCUpdatable = "POCUpdatable"
      					c.capabilityQuery = "Query"
      					c.capabilityRenditions = "Capability Redention"
      					c.capabilityUnfiling = "Unifiling"
      					c.capabilityVersionSpecificFiling = "Version specific"
      					c.capabilityJoin = "Capability Join"
			  	  	end
   
			  	 end
			  	w.repositoryInfo << repositoryInfo			  
			  end			  
			respond_to do |format|
				#format.json {render json: @tasks}
				format.xml {render xml: cmis.to_xml(false,"service","http://www.w3.org/2007/app",nil)}
			end
 		end


		def repositoryInfo
			  #Para llamar a workspace y a atom collection podemos hacer
			  # Atom::Pub::Workspace.new
			  # Atom::Pub::Collection.new(:href => 'http://example.org/myblog')

			  cmis = Atom::Cmis.new			  
			  Atom::Cmis.add_extension_namespace :app, "http://www.w3.org/2007/app"
			  Atom::Cmis.add_extension_namespace :cmisra, "http://docs.oasis-open.org/ns/cmis/restatom/200908/"
			  Atom::Cmis.add_extension_namespace :cmis, "http://docs.oasis-open.org/ns/cmis/core/200908/"
			  Atom::Cmis.add_extension_namespace :alf, "http://www.alfresco.org"			  
			  cmis.workspaces << Atom::Workspace.new do |w|
			  	 w["http://www.w3.org/2005/Atom","title"] << "Feed for folder1"			  
				 w["http://www.w3.org/2005/Atom","authors"] << Atom::Person.new(:name => 'Al Brown', :uri=>"http://www.ibm.com/", :email=>"albertcbrown@us.ibm.com")
				 w["http://www.w3.org/2005/Atom","updated"] << Time.parse('2003-12-13T18:30:02Z')
				  w["http://www.w3.org/2005/Atom","id"] << "urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af6"
				  w.links << Atom::Link.new(:href => "http://example.org/2003/12/13/atom03", :type=>"application/atom+xml;type=feed", :rel=>"self")
				  w.links << Atom::Link.new(:href => "http://example.org/2003/12/13/atom03", :type=>"application/atomsvc+xml", :rel=>"service")
				  w.links << Atom::Link.new(:href => "http://cmisexample.oasis-open.org/rep1/folder1feed", :type=>"application/atom+xml;type=entry", :rel=>"via")
				  w.links << Atom::Link.new(:href => "http://cmisexample.oasis-open.org/rep1/folder1feed/foldertree", :type=>"application/atom+xml;type=feed", :rel=>"http://docs.oasis-open.org/ns/cmis/link/200908/foldertree")
				  w.links << Atom::Link.new(:href => "http://cmisexample.oasis-open.org/rep1/folder1feed/tree", :type=>"application/cmistree+xml", :rel=>"down")
				  w.links << Atom::Link.new(:href => "http://example.org/2003/12/13/atom03", :type=>"application/atom+xml;type=feed", :rel=>"self")
				  w.links << Atom::Link.new(:href => "http://example.org/2003/12/13/atom03", :type=>"application/atom+xml;type=feed", :rel=>"self")
				  w.links << Atom::Link.new(:href => "http://example.org/2003/12/13/atom03", :type=>"application/atom+xml;type=feed", :rel=>"self")
				  w.links << Atom::Link.new(:href => "http://example.org/2003/12/13/atom03", :type=>"application/atom+xml;type=feed", :rel=>"self")			  
	 			  w.links << Atom::Link.new( :type=>"application/atom+xml;:type=>entry", :rel=>"up", :href=>"http://cmisexample.oasis-open.org/rep1/0decb4ec-6b48-4bd3-a318-e952c16da282")
	 			  w.links << Atom::Link.new( :type=>"application/atom+xml;:type=>feed", :rel=>"first", :href=>"http://cmisexample.oasis-open.org/rep1/folder1feed/first")
				  w.links << Atom::Link.new( :type=>"application/atom+xml;:type=>feed", :rel=>"next", :href=>"http://cmisexample.oasis-open.org/rep1/folder1feed/4")
				  w.links << Atom::Link.new( :type=>"application/atom+xml;:type=>feed", :rel=>"previous", :href=>"http://cmisexample.oasis-open.org/rep1/folder1feed/2")
				  w.links << Atom::Link.new( :type=>"application/atom+xml;:type=>feed", :rel=>"last", :href=>"http://cmisexample.oasis-open.org/rep1/folder1feed/last")			  			  							
			  	  w.entries << Atom::Entry.new do |e|
		    		e.title = "Atom-Powered Robots Run Amok"
		    		e.links << Atom::Link.new(:href => "http://example.org/2003/12/13/atom03")
		    		e.id = "urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a"
		    		e.updated = Time.parse('2003-12-13T18:30:02Z')
		    		e.summary = "Some text."
			  	  end			  	  			  	 
			  	   w.collections << Atom::Entry.new do |e|			  	   			  	   	
		    		e.title = "Atom-Powered Robots Run Amok"
		    		e.accept ="application/atom+xml;type=entry"
		    		e["http://docs.oasis-open.org/ns/cmis/restatom/200908/","collectionType"]<<"Folder"
			  	  end
			  	  repository = Atom::RepositoryInfo.new do |f|
			  	  	f.repositoryId = "af0e3a5a-628f-41a5-8a82-75006933331c"
			  	  	f.repositoryName = "Nombre del repositorio"
			  	  	f.repositoryDescription = "Descripción del repositorio "
			  	  	f.vendorName = "Nombre del vendor"
			  	  	f.productName = "nombre del producto"
			  	  	f.productVersion = "versión del producto"
			  	  	f.rootFolderId = "ID de la carpeta"
			  	  	f.capabilities << Atom::Capability.new do |c|
			  	  		c.capabilityACL = "CapabilityACL "
			  	  		c.capabilityAllVersionsSearchable = "bíusquedas por Capability"
			  	  		c.capabilitychanges = "Cambios en capability"
			  	  		c.capabilityContentStreamUpdatability = "capabilityContentStreamActualización"
			  	  		c.capabilitygetDescendants = "Hijos capability"
      					c.capabilityGetFolderTree = "Obtener arbol de directorios"
      					c.capabilityMultifiling = "Multifiling"
      					c.capabilityPWCSearchable = "PWC Sercheable"
      					c.capabilityPWCUpdatable = "POCUpdatable"
      					c.capabilityQuery = "Query"
      					c.capabilityRenditions = "Capability Redention"
      					c.capabilityUnfiling = "Unifiling"
      					c.capabilityVersionSpecificFiling = "Version specific"
      					c.capabilityJoin = "Capability Join"
			  	  	end
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","cmisVersionSupported"] << "1.0"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","cmisSpecificationTitle"] << "Version 1.0 Committee Draft 04"
			  	  end
			  	  w.repositories << repository
			  end					   	 		 
			respond_to do |format|
				#format.json {render json: @tasks}
				format.xml {render xml: cmis.to_xml(false,"service","http://www.w3.org/2007/app",nil)}
			end
		end

		private
			def restrict_access
				authenticate_or_request_with_http_token do |token, options|
					ApiKey.exists?(access_token: token)
				end
			end		
	end
end