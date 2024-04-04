public class Boilercls {
    public void heating (integer heatspeed){
        try{
            if(heatspeed>100){
                throw new BoilerException();
            }
            else{
                System.debug('Heating..');
            }
        }catch(BoilerException be){
            heatspeed=0;
            System.debug('Heating reset to 0');
        }
    }

}