public with sharing class TODO_ProjectsService implements IService {
	
	public interface IService {
		List<TODO_Project__c> createProjects(List<String> descriptions);
		void updateProjects(Map<Id, String> projectDescMap);
		void deactivateProjects(Set<Id> projectIds, fflib_ISObjectUnitOfWork uow);
		void activateProjects(Set<Id> projectIds, fflib_ISObjectUnitOfWork uow);
	}


	public static IService newInstance(){
		return (IService) 
			TODO_Application.service.newInstance(TODO_ProjectsService.class);
	}

	public List<TODO_Project__c> createProjects(List<String> descriptions){
		List<TODO_Project__c> projects = new List<TODO_Project__c>();

		for(String description : descriptions){
			projects.add(
				new TODO_Project__c(
					Description__c = description
				)
			);
		}

		fflib_ISObjectUnitOfWork uow = TODO_Application.unitOfWork.newInstance();
		uow.registerNew(projects);
		uow.commitWork();
		return projects;
	}


	public void updateProjects(Map<Id, String> projectDescMap){
		List<TODO_Project__c> projects = new List<TODO_Project__c>();

		for(Id projectId : projectDescMap.keySet()){
			projects.add(
				new TODO_Project__c(
					Id = projectId,
					Description__c = projectDescMap.get(projectId)
				)
			);
		}

		fflib_ISObjectUnitOfWork uow = TODO_Application.unitOfWork.newInstance();
		uow.registerDirty(projects);
		uow.commitWork();
	}


	public void deactivateProjects(Set<Id> projectIds, fflib_ISObjectUnitOfWork uow){
		List<TODO_Project__c> projects =
			TODO_ProjectsSelector.newInstance().selectById(
				projectIds
			);
		TODO_Projects.IDomain domain = TODO_Projects.newInstance(projects);
		domain.deactivateProjects();
		uow.registerDirty(projects);
	}

	public void activateProjects(Set<Id> projectIds, fflib_ISObjectUnitOfWork uow){
		List<TODO_Project__c> projects =
			TODO_ProjectsSelector.newInstance().selectById(
				projectIds
			);
		TODO_Projects.IDomain domain = TODO_Projects.newInstance(projects);
		domain.activateProjects();
		uow.registerDirty(projects);
	}

}