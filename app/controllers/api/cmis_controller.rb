# encoding: utf-8
require 'atom'
require 'atom/pub'

module Api
	class CmisController < ApplicationController
		#include ActionController::HttpAuthentication::Token::ControllerMethods
		#before_filter :restrict_access
		include ActionController::HttpAuthentication::Basic::ControllerMethods
		include ActionController::MimeResponds             
		http_basic_authenticate_with :name => "admin", :password => "admin"
		
		
		def index
 			 cmis = Atom::Cmis.new			  
			  Atom::Cmis.add_extension_namespace :app, "http://www.w3.org/2007/app"
			  Atom::Cmis.add_extension_namespace :atom, "http://www.w3.org/2005/Atom"
			  Atom::Cmis.add_extension_namespace :cra, "http://docs.oasis-open.org/ns/cmis/restatom/200908/"
			  Atom::Cmis.add_extension_namespace :ns, "http://docs.oasis-open.org/ns/cmis/core/200908/"	
			  Atom::Cmis.add_extension_namespace :cm, "http://docs.oasis-open.org/ns/cmis/messaging/200908/"				  
			  Atom::Cmis.add_extension_namespace :alf, "http://www.alfresco.org"			  
			  cmis.workspaces << Atom::Workspace.new do |w|
			  	 repositoryInfo = Atom::RepositoryInfo.new do |f|
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryId"] << "af0e3a5a-628f-41a5-8a82-75006933331d"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryName"] << "Nombre del repositorio 1 "
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryURL"] << "urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af7"
			  	 end
			  	w.repositoryInfo << repositoryInfo
			  	repositoryInfo = Atom::RepositoryInfo.new do |f|
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryId"] << "af0e3a5a-628f-41a5-8a82-75006933331c"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryName"] << "Nombre del repositorio 2"
			  	  	f["http://docs.oasis-open.org/ns/cmis/core/200908/","repositoryURL"] << "urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af8"
			  	 end
			  	w.repositoryInfo << repositoryInfo			  
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