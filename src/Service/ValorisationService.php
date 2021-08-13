<?php

namespace App\Service;

class ValorisationService
{
    public function valorisation($jeux) 
    {
        $valeur = 0;
    
        foreach ($jeux as $jeu) {
            $valeur += $jeu->getPrix();
        }
    
       return $valeur;
    }

    public function valorisationBoite($jeux) 
    {
        $valeur = 0;
        $boite = 'jeu.categorie.id';
    
        foreach ($jeux as $jeu) {
            if ($boite == 2) {
                $valeur += $jeu->getPrix();
            }
        }
    
       return $valeur;
    }
}