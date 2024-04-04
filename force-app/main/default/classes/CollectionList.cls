public class CollectionList {
    public void getName(){
        List<String>name= new list<String>();
        name.add('Anjali');
        name.add('Anjali');
        name.add('Ayush');
        name.add('Bharjina');
        name.add('Topa');
        name.add('Madhu');
        //Method 1 to iterate
        System.debug('List= '+name);
        System.debug('List Size='+name.size());
        System.debug('Check if List is Empty= '+name.isEmpty());
        System.debug('Get Element at 2= '+name.get(2));
        //clearing the list
           //name.clear();
           //System.debug('List Size='+name.size());
        name.remove(1);
        name.sort();
        System.debug('List= '+name);
        
        //Method 2 to iterate
        for(String n: name)
        {
            System.debug('List, For Loop= '+n);
        }
        
        //Method 3 to iterate
        Iterator<String> itr= name.iterator();
        System.debug('Iterator Method by List');
            while(itr.hasNext()){
                
                System.debug(itr.next());
            }
    }

}