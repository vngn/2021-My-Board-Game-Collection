<?php

namespace App\Service;

use App\Repository\JeuRepository;
use App\Entity\User;
use Symfony\Component\Security\Core\Security;

class JeuService{
    
    private $security;
    private $jeuRepo;

    public function __construct(Security $security, JeuRepository $jeuRepo){
        $this->security = $security;
        $this->jeuRepo = $jeuRepo;
    }

    public function getUserJeuByCateg($tri){
        $user = $this->security->getUser();

        if ($user){
            $jeu = $this->jeuRepo->findBy([], [$tri => 'asc']); // tous les jeux
            $jeu2 = $jeu;
            $userJeu = $user->getJeux();
            for ($i = 0; $i < count($jeu); $i++) {
                foreach ($userJeu as $ju) 
                {
                    if ($ju->getId() == $jeu[$i]->getId())
                    {
                        unset ($jeu2[$i]); // on enleve du tableau catalogue les jeux de la bibliothèque
                        break;
                    }
                }
            }
        }
        else{
            $jeu2 = $this->jeuRepo->findBy([], [ $tri => 'asc']);
        }
        
        return $jeu2;
    }
}