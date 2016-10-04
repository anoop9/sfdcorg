public with sharing class TODO_Application {

	public static final fflib_Application.UnitOfWorkFactory unitOfWork =
		new fflib_Application.UnitOfWorkFactory(
			new List<SObjectType>{
				TODO_Project__c.SObjectType,
				TODO_Task__c.SObjectType
			}
		);

	public static final fflib_Application.ServiceFactory service = 
		new fflib_Application.ServiceFactory(
			new Map<Type, Type>{
				TODO_ProjectsService.IService.class => TODO_ProjectsService.class
			}
		);

	public static final fflib_Application.SelectorFactory selector =
		new fflib_Application.SelectorFactory(
			new Map<SObjectType, Type>{
				TODO_Project__c.SObjectType => TODO_ProjectsSelector.class
			}
		);

	public static final fflib_Application.DomainFactory domain = 
		new fflib_Application.DomainFactory(
			TODO_Application.Selector,
			new Map<SObjectType, Type> {
				
			}
		);

}