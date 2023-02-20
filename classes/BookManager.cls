@RestResource(urlMapping='/v1/BookManagement/')
global class BookManager 
{
    @httpGet
    global static Capital_infro__Book__c doGetBook(){
        Capital_infro__Book__c book = new Capital_infro__Book__c();
        Map<String, String> paramsMap = RestContext.request.params;
        String bookId = paramsMap.get('Id');
        book = [Select Id, Name, Capital_infro__Price__c From Capital_infro__Book__c Where Id =: bookId];
        return book;
    }
    
    @httpDelete
    global static String doDeleteBook(){
        Capital_infro__Book__c book = new Capital_infro__Book__c();
        Map<String, String> paramsMaps = RestContext.request.params;
        String bookId = paramsMaps.get('Id');
        book = [Select Id, Name, Capital_infro__Price__c From Capital_infro__Book__c Where Id =: bookId];
        delete book;
        return 'Record Deleted!';
    }
    
    @httpPost
    global static Capital_infro__Book__c doCreateBook(BooksInfo bookInfo){
        Capital_infro__Book__c book = bookInfo.book;
        insert book;
        return book;
    }
    @httpPut
    global static Capital_infro__Book__c doUpdateBook(String Name){
        Map<String, String> paramsMap = RestContext.request.params;
        String bookId = paramsMap.get('Id');
        Capital_infro__Book__c book = new Capital_infro__Book__c(Name = name, Id = bookId);
        update book;
        return book;
    }
    
    global class BooksInfo{
       global  Capital_infro__Book__c book { get; set; }
    }
}