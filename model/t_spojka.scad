drazka=8;
m6_dira=7;



module spojka(){
    difference(){
        union(){
            linear_extrude(height=5)
                square([40,60],center=true);
            linear_extrude(height=7)
                translate([0,-15])
                    square([drazka,30-1],center=true);
            linear_extrude(height=7)
                translate([0,15])
                    square([30,drazka],center=true);
            linear_extrude(height=35)
                translate([0,-15.1,0])
                    difference(){
                        square([40,30-0.1],center=true);
                        square([30+0.2,30],center=true);
                    }
            
        }
        for(a=[-15:30:15]){
            translate([0,a,-1])
                cylinder(d=m6_dira,h=9);
        }
        translate([0,-15,15+5])
            rotate([0,90,0])
                cylinder(d=m6_dira,h=45,center=true);
    }
}

spojka();