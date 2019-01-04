m6_dira = 7;
diry_l = 30;
m8_dira = 9;
m8_hlava = 15;
drazka = 8;

module uchyt_vahadla(){
    difference(){
        union(){
            linear_extrude(height = 10){
                hull(){
                    translate([diry_l/2,0])
                        circle(d=15);
                    translate([-diry_l/2,0])
                        circle(d=15);
                    square([diry_l,30],center = true);
                }            
            }
            linear_extrude(height = 12){
                hull(){                    
                    translate([diry_l/2+4,0])
                       circle(d=drazka);
                    translate([-diry_l/2-4,0])
                        circle(d=drazka);

                }
            }    
            
        }
        translate([diry_l/2,0,-1])
            cylinder(d=m6_dira,h=20);
        translate([-diry_l/2,0,-1])
            cylinder(d=m6_dira,h=20);
        
        translate([0,0,-1])
            cylinder(d=m8_dira,h=20);
        rotate([0,0,90])
            translate([0,0,4])
                cylinder(d=m8_hlava,h=16,$fn=6);
    
    }
}

module kloub(){
    color("DarkSlateGray",1){
        sphere(13/2);
        cylinder(d=5,h=19.2);
        translate([0,0,9-2])
            cylinder(d=8,h=2);
        rotate([90,0,0])
            cylinder(d=8,h=22);
    }    
}
kloub();

    

//uchyt_vahadla();