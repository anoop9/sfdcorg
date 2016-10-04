public class TODO_ProjectsSelector extends fflib_SObjectSelector 
											implements ISelector {

	public interface ISelector extends fflib_ISObjectSelector {
		List<TODO_Project__c> selectById(Set<Id> recordIds);
	}


	public static ISelector newInstance(){
		return (ISelector) 
			TODO_Application.selector.newInstance(TODO_Project__c.sObjectType);
	}


	public List<Schema.SObjectField> getSObjectFieldList(){
		return new List<Schema.SObjectField>{
			TODO_Project__c.Id,
			TODO_Project__c.Description__c,
			TODO_Project__c.Active__c
		};
	}


	public Schema.SObjectType getSObjectType(){
		return TODO_Project__c.SObjectType;
	}

	public List<TODO_Project__c> selectById(Set<Id> recordIds){
		return (List<TODO_Project__c>) selectSObjectsById(recordIds);
	}

}