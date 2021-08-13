<?php

namespace App\Controller;

use App\Entity\Jeu;
use App\Entity\User;
use App\Form\JeuType;
use App\Repository\JeuRepository;
use App\Repository\UserRepository;
use App\Service\JeuService;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CatalogueController extends AbstractController
{
    /**
     * @Route("/catalogue", name="catalogue")
     */
    public function index(JeuRepository $repo): Response
    {        
        return $this->render('catalogue/index.html.twig', [
            'jeu' => $repo->findByAllNom() // lié à la requête SQl du repository pour tri global par nom
        ]);
    }

    /**
     * @Route("/catalogue/{id}/show", name="show", methods={"GET"})
     */
    public function show(Jeu $jeu): Response
    {
        return $this->render('catalogue/show.html.twig', [
            'jeu' => $jeu
        ]);
    }

    /**
     * @Route("/catalogue/add", name="add", methods={"GET","POST"})
     * @IsGranted("ROLE_ADMIN")
     */
    public function add(Request $request, EntityManagerInterface $em): Response
    {
        $jeu = new Jeu();
        $form = $this->createForm(JeuType::class, $jeu);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if (!empty($jeu->getImage())) {
                $file = $jeu->getImage();
                $filename = md5(uniqid()) . '.' . $file->guessExtension();
                $file->move($this->getParameter('upload_directory'), $filename);
                $jeu->setImage($filename);
            }

            $em->persist($jeu);
            $message = $jeu->getNom() . ' a été ajouté au catalogue';
            $this->addFlash('success', $message);
            $em->flush();

            return $this->redirectToRoute('catalogue');
        }

        return $this->render('catalogue/add.html.twig', [
            'jeu' => $jeu,
            'formJeu' => $form->createView()
        ]);
    }

    /**
     * @Route("/catalogue/{id}/edit", name="edit", methods={"GET","POST"})
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

            return $this->redirectToRoute('catalogue');
        }

        return $this->render('catalogue/edit.html.twig', [
            'jeu' => $jeu,
            'formJeu' => $form->createView()
        ]);
    }

    /**
     * @Route("/catalogue/{id}/delete", name="delete", methods={"POST"})
     * @IsGranted("ROLE_ADMIN")
     */
    public function delete(Jeu $jeu, Request $request): Response
    {
        if ($this->isCsrfTokenValid('delete' . $jeu->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($jeu);
            $entityManager->flush();
        }

        $message = $jeu->getNom() . ' a été supprimé du catalogue';
        $this->addFlash('success', $message);

        return $this->redirectToRoute('catalogue');
    }

    /**
     * @Route("/catalogue/nom", name="catalogue_nom")
     */
    public function Nom(JeuRepository $repo): Response
    {        
        return $this->render('catalogue/index.html.twig', [
            'jeu' => $repo->findByAllNom() // lié à la requête SQl du repository pour tri global par nom
        ]);
    }

    /**
     * @Route("/catalogue/editeur", name="catalogue_editeur")
     */
    public function Editeur(JeuRepository $repo): Response
    {
        return $this->render('catalogue/index.html.twig', [
            'jeu' => $repo->findByAllEditeur() // lié à la requête SQl du repository pour tri global par nom
        ]);
    }

    /**
     * @Route("/catalogue/categorie", name="catalogue_categorie")
     */
    public function Categorie(JeuRepository $repo): Response
    {
        return $this->render('catalogue/index.html.twig', [
            'jeu' => $repo->findByAllCategorie() // lié à la requête SQl du repository pour tri global par nom
        ]);
    }

    /**
     * @Route("/catalogue/langue", name="catalogue_langue")
     */
    public function Langue(JeuRepository $repo): Response
    {
        return $this->render('catalogue/index.html.twig', [
            'jeu' => $repo->findByAllLangue() // lié à la requête SQl du repository pour tri global par nom
        ]);
    }

    /**
     * @Route("/catalogue/sortie", name="catalogue_sortie")
     */
    public function Sortie(JeuRepository $repo): Response
    {
        return $this->render('catalogue/index.html.twig', [
            'jeu' => $repo->findByAllSortie() // lié à la requête SQl du repository pour tri global par nom
        ]);
    }

    /**
     * @Route("/catalogue/prix", name="catalogue_prix")
     */
    public function Prix(JeuRepository $repo): Response
    {
        return $this->render('catalogue/index.html.twig', [
            'jeu' => $repo->findByAllPrix() // lié à la requête SQl du repository pour tri global par nom
        ]);
    }
}