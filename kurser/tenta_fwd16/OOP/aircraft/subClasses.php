<?php

require_once ("aircraft.php");
require_once ("interface.php");
require_once ("trait.php");

error_reporting(-1);

//skapa klass som implimentera interfacet
                                            /* interface */
class Interceptor extends aircraft implements i_Texaco{
    //use trait
    use t_refuel;
    
    public $missiles;
    
    public function __construct($missiles, $aircraftDesignation, $speed, $range, $payload) {
        
        $this->missiles = $missiles;
        
        parent::__construct($aircraftDesignation, $speed, $range, $payload);
    }
}
                                 /* interface */
class Bomber extends aircraft implements i_Texaco {
    /* trait */
    use t_refuel;
    
    public $bombs;
    
    public function __construct($bombs, $aircraftDesignation, $speed, $range, $payload) {
        
        $this->bombs = $bombs;
        // :: är när klasser kommunicerar med varandra
        parent::__construct($aircraftDesignation, $speed, $range, $payload);
} 
}