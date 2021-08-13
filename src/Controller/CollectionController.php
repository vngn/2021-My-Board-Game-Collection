<?php

namespace App\Controller;

use App\Entity\Jeu;
use App\Form\JeuType;
use App\Repository\JeuRepository;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CollectionController extends AbstractController
{
    /**
     * @Route("/collection", name="collection")
     * @IsGranted("ROLE_USER")
     */
    public function collection(JeuRepository $repo): Response
    {
        $user = $this->getUser();

        return $this->render('collection/index.html.twig', [
            'jeux' => $repo->findByAllNomUser($user->getId()) // lié à la requête SQl du repository pour tri global par nom
        ]);
    }

    /**
     * @Route("/collection/{id}/show", name="show_collection", methods={"GET"})
     * @IsGranted("ROLE_USER")
     */
    public function show(Jeu $jeu): Response
    {
        return $this->render('collection/show.html.twig', [
            'jeu' => $jeu
        ]);
    }
    
    /**
     * @Route("/collection/{id}/add", name="add_collection", methods={"GET"})
     * @IsGranted("ROLE_USER")
     */
    public function add(Jeu $jeu, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();
        $user->addJeux($jeu);
        $em->flush(); 

        $message = $jeu->getNom() . ' a été ajouté à votre collection';
        $this->addFlash('success' ,$message);
            
        return $this->redirectToRoute('delta'); 
    }

    /**
     * @Route("/collection/{id}/edit", name="edit_collection", methods={"GET","POST"})
     * @IsGranted("ROLE_ADMIN")
     */
    public function edit(Jeu $jeu, Request $request, EntityManagerInterface $em): Response
    {
        $oldImage = $jeu->getImage();
        $form = $this->createForm(JeuType::class, $jeu);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            if (!empty($jeu->getImage())) {
                $file = $jeu->getImage();
                $filename = md5(uniqid()) . '.' . $file->guessExtension();
                $file->move($this->getParameter('upload_directory'), $filename);
                $jeu->setImage($filename);
            } else {
                $jeu->setImage($oldImage);
            }

            $em->persist($jeu);
            $message = $jeu->getNom() . ' a été modifié';
            $this->addFlash('success', $message);
            $em->flush();

            return $this->redirectToRoute('collection');
        }

        return $this->render('collection/edit.html.twig', [
            'jeu' => $jeu,
            'formJeu' => $form->createView()
        ]);
    }

    /**
     * @Route("/collection/{id}/delete", name="delete_collection", methods={"POST"})
     * @IsGranted("ROLE_USER")
     */
    public function delete(Jeu $jeu, Request $request,EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$jeu->getId(), $request->request->get('_token'))) {
            $user = $this->getUser();
            $user->removeJeux($jeu);
             $em->flush();
        }

        $message = $jeu->getNom() . ' a été supprimé de votre collection';
        $this->addFlash('success' ,$message);
    
        return $this->redirectToRoute('collection'); 
    }

    /**
     * @Route("/collection/nom", name="collection_nom")
     * @IsGranted("ROLE_USER")
     */
    public function Nom(JeuRepository $repo): Response
    {
        $user = $this->getUser();

        return $this->render('collection/index.html.twig', [
            'jeux' => $repo->findByAllNomUser($user->getId()) // lié à la requête SQl du repository pour tri global par nom
        ]);
    }

    /**
     * @Route("/collection/editeur", name="collection_editeur")
     * @IsGranted("ROLE_USER")
     */
    public function Editeur(JeuRepository $repo): Response
    {
        $user = $this->getUser();

        return $this->render('collection/index.html.twig', [
            'jeux' => $repo->findByAllEditeurUser($user->getId()) // lié à la requête SQl du repository pour tri global par editeur
        ]);
    }

    /**
     * @Route("/collection/categorie", name="collection_categorie")
     * @IsGranted("ROLE_USER")
     */
    public function Categorie(JeuRepository $repo): Response
    {
        $user = $this->getUser();

        return $this->render('collection/index.html.twig', [
            'jeux' => $repo->findByAllCategorieUser($user->getId()) // lié à la requête SQl du repository pour tri global par categorie
        ]);
    }

    /**
     * @Route("/collection/langue", name="collection_langue")
     * @IsGranted("ROLE_USER")
     */
    public function Langue(JeuRepository $repo): Response
    {
        $user = $this->getUser();

        return $this->render('collection/index.html.twig', [
            'jeux' => $repo->findByAllLangueUser($user->getId()) // lié à la requête SQl du repository pour tri global par langue
        ]);
    }

    /**
     * @Route("/collection/sortie", name="collection_sortie")
     * @IsGranted("ROLE_USER")
     */
    public function Sortie(JeuRepository $repo): Response
    {
        $user = $this->getUser();

        return $this->render('collection/index.html.twig', [
            'jeux' => $repo->findByAllSortieUser($user->getId()) // lié à la requête SQl du repository pour tri global par sortie
        ]);
    }

    /**
     * @Route("/collection/prix", name="collection_prix")
     * @IsGranted("ROLE_USER")
     */
    public function Prix(JeuRepository $repo): Response
    {
        $user = $this->getUser();

        return $this->render('collection/index.html.twig', [
            'jeux' => $repo->findByAllPrixUser($user->getId()) // lié à la requête SQl du repository pour tri global par prix
        ]);
    }
}