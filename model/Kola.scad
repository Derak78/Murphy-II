module kolo(){
    color("Black",1)
    rotate_extrude(angle = 360){
        translate([100,0])
            circle(d=50);
    }
    color("Silver",1){
        cylinder(d1=170,d2=120,h=30);
        rotate([180,0,0])
            cylinder(d1=170,d2=120,h=30);
        cylinder(d=46,h=40);
    }    
    color("DarkSlateGray",1){
        translate([0,0,40]){
            cylinder(d=17,h=18);
            difference(){
                cylinder(d=16,h=70);
                translate([-8,16/2-2.5,22])
                    cube([16,16,44.5]);
                cylinder(d=9,h=100);
            }    
        }    
    }
   // cylinder(d=250,h=10);
}    

kolo();

