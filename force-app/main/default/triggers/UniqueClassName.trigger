trigger UniqueClassName on Class__c (before insert) {
    Set<String> existingClassNames = new Set<String>();
    
    // Collect existing class names
    for (Class__c cls : [SELECT Name FROM Class__c]) {
        existingClassNames.add(cls.Name);
    }
    
    // Check for duplicates 
    for (Class__c newCls : Trigger.new) {
        if (existingClassNames.contains(newCls.Name)) {
            newCls.addError('A class with this name already exists!!!!');
        }
    }
}