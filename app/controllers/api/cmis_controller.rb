# encoding: utf-8
require 'atom'
require 'atom/pub'

module Api
	class CmisController < ApplicationController
		#include ActionController::HttpAuthentication::Token::ControllerMethods
		#before_filter :restrict_access
		include ActionController::HttpAuthentication::Basic::ControllerMethods
		include ActionController::MimeResponds             
		#http_basic_authenticate_with :name => "admin", :password => "admin"
		
		
		def index			
 			 cmis = Atom::Cmis.new			  
			  Atom::Cmis.add_extension_namespace :app, "http://www.w3.org/2007/app"
			  Atom::Cmis.add_extension_namespace :atom, "http://www.w3.org/2005/Atom"
			  Atom::Cmis.add_extension_namespace :cmisra, "http://docs.oasis-open.org/ns/cmis/restatom/200908/"
			  Atom::Cmis.add_extension_namespace :cmis, "http://docs.oasis-open.org/ns/cmis/core/200908/"	
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
			  	  		c["http://docs.oasis-open.org/ns/cmis/core/200908/", "capabilityACL"] << "none"
			  	  		c["http://docs.oasis-open.org/ns/cmis/core/200908/","capabilityAllVersionsSearchable"] << "none"
			  	  		c["http://docs.oasis-open.org/ns/cmis/core/200908/","capabilitychanges"] << "none"
			  	  		c.capabilityAllVersionsSearchable = "false"
			  	  		c.capabilitychanges = "none"			  	  		
      					c.capabilityMultifiling = "true"
      					c.capabilityPWCSearchable = "true"
      					c.capabilityPWCUpdatable = "true"
      					c.capabilityQuery = "bothcombined"
      					c.capabilityRenditions = "Capability Redention"
      					c.capabilityUnfiling = "false"
      					c.changesIncomplete = "false"
      					c.capabilityJoin = "none"
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
				#format.xml {render xml: cmis.to_xml(false,"service","http://www.w3.org/2007/app",nil)}

				format.xml { render xml: '<?xml version="1.0" encoding="UTF-8"?>
					<app:service xmlns:app="http://www.w3.org/2007/app" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:cmis="http://docs.oasis-open.org/ns/cmis/core/200908/" xmlns:cmisra="http://docs.oasis-open.org/ns/cmis/restatom/200908/">
					<app:workspace><atom:title>A1</atom:title><cmisra:repositoryInfo xmlns:ns3="http://docs.oasis-open.org/ns/cmis/messaging/200908/"><cmis:repositoryId>A1</cmis:repositoryId><cmis:repositoryName>Apache Chemistry OpenCMIS InMemory Repository</cmis:repositoryName><cmis:repositoryDescription>Apache Chemistry OpenCMIS InMemory Repository (Version: 0.8.0-SNAPSHOT)</cmis:repositoryDescription><cmis:vendorName>Apache Chemistry</cmis:vendorName><cmis:productName>OpenCMIS InMemory-Server</cmis:productName><cmis:productVersion>0.8.0-SNAPSHOT</cmis:productVersion><cmis:rootFolderId>100</cmis:rootFolderId><cmis:latestChangeLogToken>0</cmis:latestChangeLogToken><cmis:capabilities><cmis:capabilityACL>manage</cmis:capabilityACL><cmis:capabilityAllVersionsSearchable>false</cmis:capabilityAllVersionsSearchable><cmis:capabilityChanges>none</cmis:capabilityChanges><cmis:capabilityContentStreamUpdatability>anytime</cmis:capabilityContentStreamUpdatability><cmis:capabilityGetDescendants>true</cmis:capabilityGetDescendants><cmis:capabilityGetFolderTree>true</cmis:capabilityGetFolderTree><cmis:capabilityMultifiling>true</cmis:capabilityMultifiling><cmis:capabilityPWCSearchable>false</cmis:capabilityPWCSearchable><cmis:capabilityPWCUpdatable>true</cmis:capabilityPWCUpdatable><cmis:capabilityQuery>bothcombined</cmis:capabilityQuery><cmis:capabilityRenditions>none</cmis:capabilityRenditions><cmis:capabilityUnfiling>true</cmis:capabilityUnfiling><cmis:capabilityVersionSpecificFiling>false</cmis:capabilityVersionSpecificFiling><cmis:capabilityJoin>none</cmis:capabilityJoin></cmis:capabilities><cmis:aclCapability><cmis:supportedPermissions>basic</cmis:supportedPermissions><cmis:propagation>objectonly</cmis:propagation><cmis:permissions><cmis:permission>cmis:read</cmis:permission><cmis:description>Read</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>cmis:write</cmis:permission><cmis:description>Write</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>cmis:all</cmis:permission><cmis:description>All</cmis:description></cmis:permissions><cmis:mapping><cmis:key>canGetDescendents.Folder</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetChildren.Folder</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetParents.Folder</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetFolderParent.Object</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCreateDocument.Folder</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCreateFolder.Folder</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCreateRelationship.Source</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCreateRelationship.Target</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetProperties.Object</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canViewContent.Object</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canUpdateProperties.Object</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canMove.Object</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canMove.Target</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canMove.Source</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canDelete.Object</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canDeleteTree.Folder</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canSetContent.Document</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canDeleteContent.Document</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canAddToFolder.Object</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canAddToFolder.Folder</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canRemoveFromFolder.Object</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canRemoveFromFolder.Folder</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCheckout.Document</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCancelCheckout.Document</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCheckin.Document</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetAllVersions.VersionSeries</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetObjectRelationships.Object</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canAddPolicy.Object</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canAddPolicy.Policy</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canRemovePolicy.Object</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canRemovePolicy.Policy</cmis:key><cmis:permission>cmis:write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetAppliedPolicies.Object</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetACL.Object</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canApplyACL.Object</cmis:key><cmis:permission>cmis:all</cmis:permission></cmis:mapping></cmis:aclCapability><cmis:cmisVersionSupported>1.0</cmis:cmisVersionSupported><cmis:thinClientURI></cmis:thinClientURI><cmis:changesIncomplete>true</cmis:changesIncomplete><cmis:principalAnonymous>anonymous</cmis:principalAnonymous><cmis:principalAnyone>anyone</cmis:principalAnyone></cmisra:repositoryInfo></app:workspace></app:service>' }

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