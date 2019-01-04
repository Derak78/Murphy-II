module profil20x20(l){
    color("Gainsboro",1)
    linear_extrude(height=l,center=true,convexity=10,twist=0){
        difference(){
            square(20,center=true);
            square(16,center=true);
        }
    }
}

module lozisko608zz(){
    color("Silver")
        difference(){
            cylinder(d=22,h=7,center=true);
            cylinder(d=19,h=8,center=true);
        }
    color("Silver")
        difference(){
            cylinder(d=12,h=7,center=true);
            cylinder(d=8,h=8,center=true);
        }
    color("DarkKhaki")
        difference(){
            cylinder(d=19,h=6,center=true);
            cylinder(d=12,h=8,center=true);
        }
}        

lozisko608zz();
/*
rotate([90,0,0])
    profil20x20(300);
*/
