=============================================
== README for sf-build.xml                 ==
=============================================

---------------------------------------------
-- Introduction
---------------------------------------------
This script should be used for all metadata deployments to Salesforce.com, including large, zipped static resources. 

---------------------------------------------
-- Files
---------------------------------------------

 sf-build.properties : Properties file containing SFDC login details
 sf-build.xml        : Main build file


---------------------------------------------
-- Usage
---------------------------------------------

 - To deploy metadata to a sandbox:
     ant -f sf-build.xml deploy_metadata -Dorg=<.your_org>
   
 - To deploy org specific metadata to a sandbox:
     ant -f sf-build.xml deploy_metadata_org_specific -Dorg=<.your_org>
 
 - To deploy destructive metadata changes to a sandbox:
     ant -f sf-build.xml deploy_metadata -Dorg=<.your_org> -Dsrc.dir=../src_destroy
     
 - To deploy any of the above to production:
     remove argument : -Dorg=<.your_org>
     add argument    : -Dsf.deploy.serverurl=https://login.salesforce.com

NB: other properties can also be overridden via the command line if required.

The following commands are for the handling of Static Resources. These commands use the folder [project root]/Static Resources and its subdirectories to create zip versions of those resources, copies them to src/staticresources, and deploys them to the dev org.

 - To clean the working directory (src/staticresources):
	ant -f sf-build.xml clean

 - To compress the working resources in Static Resources/src:
	ant -f sf-build.xml compress

 - To copy the compressed resources to src/staticresources:
	ant -f sf-build.xml copy-resources

 - To deploy the compressed resources in Static Resources/src to the dev org:
	ant -f sf-build.xml deploy-resources

 - To do all of the above:
	ant -f sf-build.xml do-resources

