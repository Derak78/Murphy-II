diry=4;
vrstva = 0.4;


module  lozisko_dira(){
    cylinder(d=22.5,h=7.5,$fn=40);  
    difference(){
        cylinder(d=24,h=7.5,$fn=40);
        for(a=[0:30:180]){
            rotate([0,0,a])
                cube([40,2,20],center=true);
        }
    }
}

module paka_lozisko(){
    difference(){
        union(){
            translate([-22,-15,0])
              cube([44,30,4]);
            cylinder(d=30,h=8,$fn=40);
        }
        translate([0,0,1])
            lozisko_dira();
        cylinder(d=12,h=10,$fn=20);
        for(a=[-17:34:17]){
            for(b=[-10:20:10]){
                translate([a,b,0])
                    cylinder(d=diry,h=10,$fn=20);
            }
        }        
    }

}

paka_lozisko();