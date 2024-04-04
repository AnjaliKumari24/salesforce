public class CollectionMap {
     public void getName(){
        Map<Integer,String>name= new Map<Integer,String>();
        name.put(5,'Anjali');
        name.put(2,'Anjali');
        name.put(3,'Ayush');
        name.put(4,'Bharjina');
        name.put(1,'Topa');
        name.put(4,'Madhu');
        name.put(null, null);
        System.debug('Map= '+name);
        //System.debug(name.remove(5));
        //System.debug('new map= '+name);

}
}