@isTest
public class AnimalLocatorTest {

    @isTest static  void testGetAnimalNameById() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        // Call method to test
        String result = AnimalLocator.getAnimalNameById(Integer.valueOf('123'));
        // Verify mock response is not null
        System.assertNotEquals(null,result,
            'The callout returned a null response.');
        // Verify status code
             
    } 
    

}