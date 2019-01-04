m6_dira  = 7;
profil_drazka = 8;

module drzak_kola(){
    difference(){
        union(){
            translate([0,0,6])
                cube([50,profil_drazka,2],center = true);
            translate([0,0,-2-2.5])
                cube([50,30,20],center = true);
        }    
        rotate([90,0,0])
            cylinder(d=16,h=32,center=true);
        translate([0,0,10])
                cube([12,30,20],center = true);
        translate([15,0,0])
            cylinder(d=m6_dira,h=30,center = true);
        translate([-15,0,0])
            cylinder(d=m6_dira,h=30,center = true);
    
    }    
}

drzak_kola();