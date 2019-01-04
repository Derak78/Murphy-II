profil_30x30_delka = 0;

module profil_30x30_rez(){
    difference(){
        square([30,30],center=true);
        square([26,26],center=true);
        square([40,8],center=true);
        square([8,40],center=true);    
    }
    difference(){
        intersection(){
            square([30,30],center=true);
            union(){
                square([14,14],center=true);
                rotate(45){
                    square([2,40],center=true);
                    square([40,2],center=true);
                }    
            }    
        }    
        square([10,10],center=true);
    }
 }   
 
 module profil_30x30(delka){
     color("Silver",1)
        linear_extrude(height=delka)
            profil_30x30_rez();
     profil_30x30_delka =profil_30x30_delka + delka;
     echo("30x30 ",delka);
     //echo("30x30 celkem ",profil_30x30_delka);
}    

module profil_30x5(delka){
    linear_extrude(height=delka){
        square([30,5]);
    }
    echo("30x5",delka);
}    
//profil_30x30(300);