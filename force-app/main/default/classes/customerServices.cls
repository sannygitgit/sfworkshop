public class customerServices 
{
    @auraEnabled(cacheable=true)
    public static Customer getCustomerFields(String objectType)
    {
        Customer customer;
        
        for(Customer_Fields__mdt c: [SELECT Customer_Name__r.QualifiedAPIName, Customer_Email__r.QualifiedAPIName, Customer_City__c, Customer_State__c, Customer_Status__r.QualifiedAPIName
                                        FROM Customer_Fields__mdt 
                                        WHERE Sobject_Type__r.QualifiedAPIName = :objectType])
        {
            customer = new Customer(c.Customer_Name__r.QualifiedAPIName, c.Customer_Email__r.QualifiedAPIName, c.Customer_City__c, c.Customer_State__c, '', '');
        }
        
        return customer;
    }

    public class Customer
    {
        @auraEnabled
        public String email {get; set;}

        @auraEnabled
        public String name {get; set;}

        @auraEnabled
        public String city {get; set;}

        @auraEnabled
        public String state {get; set;}

        @auraEnabled
        public String status {get; set;}

        @auraEnabled
        public String Id {get; set;}

        public Customer(String name, String email, String city, String state, String status, String custId)
        {
            this.name = name;
            if(String.isNotEmpty(email)) this.email = email;
            if(String.isNotEmpty(city)) this.city = city;
            if(String.isNotEmpty(state)) this.state = state;
            if(String.isNotEmpty(status)) this.status = status;
            if(String.isNotEmpty(custId)) this.Id = custId;    
        }
    }
}