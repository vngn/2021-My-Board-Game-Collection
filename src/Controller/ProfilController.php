<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\EditMdpType;
use App\Form\EditProfilType;
use App\Repository\JeuRepository;
use App\Repository\UserRepository;
use App\Service\ValorisationService;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class ProfilController extends AbstractController
{
    /**
     * @Route("/profil", name="profil")
     * @IsGranted("ROLE_USER")
     */
    public function index(JeuRepository $repo, ValorisationService $valorisation): Response
    {
        $user = $this->getUser();
        $jeux = $repo->findByAllNomUser($user->getId());
        
        $valeur = $valorisation->valorisation($jeux);

        return $this->render('profil/index.html.twig', [
            'jeux' => $repo->findByAllNomUser($user->getId()), // lié à la requête SQl du repository pour tri global par nom
            'valeur' => $valeur
        ]);
    }

    /**
     * @Route("/profil/editProfil", name="profil_edit")
     * @IsGranted("ROLE_USER")
     */
    public function editProfil(Request $request, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();
        $form = $this->createForm(EditProfilType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($user);
            $message = $user->getPseudo() . ' a été modifié';
            $this->addFlash('success', $message);
            $em->flush();

            return $this->redirectToRoute('profil');
        }

        return $this->render('profil/editProfil.html.twig', [
            'editProfil' => $form->createView(),
        ]);
    }

    /**
     * @Route("/profil/editMdp", name="mdp_edit")
     * @IsGranted("ROLE_USER")
     */
    public function editMdp(Request $request, UserPasswordHasherInterface $passwordHasher, UserRepository $userRepo)
    {
        $user = new User();
        $form = $this->createForm(EditMdpType::class, $user);
        $form->handleRequest($request);

        if ($request->isMethod('POST')) {
            $em = $this->getDoctrine()->getManager();
            $user = $this->getUser();
            // on vérifie si les deux mots de passe sont identiques
            if ($form->isSubmitted() && $form->isValid()) {
                $user->setPassword($passwordHasher->hashPassword($user, $form->get('plainPassword')->getData()));
                $em->flush();
                $message = 'Mot de passe mis à jour avec succès';
                $this->addFlash('success', $message);

                return $this->redirectToRoute('profil');
            } 
        }

        return $this->render('profil/editMdp.html.twig', [
            'editMdp' => $form->createView(),
            'user' => $userRepo->findAll(),
        ]);
    }
}
