drazka=8;
m6_dira=7;



module spojka(){
    difference(){
        union(){
            linear_extrude(height=5)
                square([30,60],center=true);
            linear_extrude(height=7)
                translate([0,-15])
                    square([drazka,30-1],center=true);
            linear_extrude(height=7)
                translate([0,15])
                    square([30,drazka],center=true);
            
        }
        for(a=[-15:30:15]){
            translate([0,a,-1])
                cylinder(d=m6_dira,h=9);
        }    
    }
}

spojka();