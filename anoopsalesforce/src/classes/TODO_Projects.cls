public with sharing class TODO_Projects extends fflib_SObjectDomain 
											implements IDomain {
	
	public interface IDomain {
		void deactivateProjects();
		void activateProjects();
	}


	public static IDomain newInstance(List<TODO_Project__c> sObjectList){
		return (IDomain)
			TODO_Application.domain.newInstance(sObjectList);
	}

	public TODO_Projects(List<TODO_Project__c> records){
		super(records);
	}

	public override void onApplyDefaults(){
		for(TODO_Project__c project : (List<TODO_Project__c>) records){
			project.Active__c = true;
		}
	}


	public override void onValidate(){
		validateDescription();
	}

	public override void onValidate(Map<Id, SObject> existingRecords){
		validateDescription();
	}

	private void validateDescription(){
		for(TODO_Project__c project : (List<TODO_Project__c>) records){
			if(String.isBlank(project.Description__c)){
				project.Description__c.addError(
					error( 
						'You need to enter a description', 
							project,  
								TODO_Project__c.Description__c)
				);
			}
		}
	}


	public void deactivateProjects(){
		for(TODO_Project__c project : (List<TODO_Project__c>) records){
			project.Active__c = false;
		}
	}

	public void activateProjects(){
		for(TODO_Project__c project : (List<TODO_Project__c>) records){
			project.Active__c = true;
		}
	}



	public class Constructor implements fflib_SObjectDomain.IConstructable {
		public fflib_SObjectDomain construct(List<SObject> sObjectList){
			return new TODO_Projects(sObjectList);
		}
	}
}