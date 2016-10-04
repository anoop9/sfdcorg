public with sharing class TODO_ProjectsController {

	public void updateTasks(List<Id> activeIds, List<Id> deactiveIds){
		TODO_ProjectsService.IService service = TODO_ProjectsService.newInstance();
		fflib_ISObjectUnitOfWork uow = TODO_Application.unitOfWork.newInstance();

		service.activateProjects( new Set<Id>(activeIds), uow );
		service.deactivateProjects( new Set<Id>(deactiveIds), uow );

		uow.commitWork();
	}

}