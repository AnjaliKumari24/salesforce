public class CollectionSet {
    
    public void getName(){
        Set<String>name= new set<String>();
        name.add('Anjali');
        name.add('Anjali');
        name.add('Ayush');
        name.add('Bharjina');
        name.add('Topa');
        name.add('Madhu');
        
        //Method 1 to iterate
        System.debug('Set= '+name);
        System.debug('Set Size='+name.size());
        System.debug('Check if List is Empty= '+name.isEmpty());
        
        
        //Method 2 to iterate
        for(String n: name)
        {
            System.debug('Set, For Loop= '+n);
        }
        
        //Method 3 to iterate
        Iterator<String> itr= name.iterator();
        System.debug('Iterator Method by Set');
            while(itr.hasNext()){
                
                System.debug(itr.next());
            }
    }

}